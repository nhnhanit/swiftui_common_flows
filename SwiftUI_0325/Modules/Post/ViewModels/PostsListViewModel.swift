//
//  PostsListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

@MainActor
protocol PostsListViewModeling: ObservableObject {
    var postCells: [PostCellViewModel] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }

    func loadPostsIfNeeded()
    func loadPosts()
    func cancelLoading()
    func selectPost(_ post: Post)
    func deletePost(at indexSet: IndexSet) async
}

@MainActor
final class PostsListViewModel: PostsListViewModeling {
    private let postRepository: PostRepository
    private let postCoordinator: PostCoordinator
    @Published var postCells: [PostCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    var hasLoaded = false
    
    private var currentTask: Task<Void, Never>?
    private let appAlertManager: AppAlertManager
    
    init(postRepository: PostRepository, postCoordinator: PostCoordinator, appAlertManager: AppAlertManager) {
        print("🔁 PostsListViewModel INIT")
        
        self.postRepository = postRepository
        self.postCoordinator = postCoordinator
        self.appAlertManager = appAlertManager
    }
    
    deinit {
        print("❌ DEINIT PostsListViewModel")
    }
    
    func loadPostsIfNeeded()  {
        guard !hasLoaded else { return }
        hasLoaded = true
        loadPosts()
    }
    
    func loadPosts() {
        // 🔒 Prevent multiple calls
        guard currentTask == nil else {
            print("⏳ Already fetching posts...")
            return
        }
        
        // 1️⃣ Show cached data immediately
        let cachedPosts = postRepository.loadCachedPosts()
        if !cachedPosts.isEmpty {
            postCells = cachedPosts
                .prefix(3) // only need to show 3 items from cache
                .map {
                PostCellViewModel(post: $0, postRepository: postRepository)
            }
        }
        
        // 2️⃣ Then try refreshing from network
        currentTask = Task { [weak self] in
            guard let self else { return }
            await fetchPostsFromNetwork()
            self.currentTask = nil
        }
        
    }
    
    func cancelLoading() {
        currentTask?.cancel()
    }
    
    func fetchPostsFromNetwork() async {
        isLoading = true
        
        do {
            let freshPosts = try await postRepository.fetchPosts()
            postCells = freshPosts.map {
                PostCellViewModel(post: $0, postRepository: postRepository)
            }
        } catch is CancellationError {
            print("❌ Task was cancelled intentionally.")
        } catch {
            self.showErrorAlert(title: "Can not load new posts", message: error.localizedDescription)
        }
        
        isLoading = false
    }
    
    private func showErrorAlert(title: String, message: String) {
        appAlertManager.showAlert(
            title: title,
            message: message,
            primary: .init(title: "OK", role: .cancel)
        )
    }
    
    func selectPost(_ post: Post) {
        let detailVM = PostDetailViewModel(post: post, postRepository: postRepository)
        
        // 👇 Callback from Detail to List
        detailVM.onUpdate = { [weak self] updatedPost in
            guard let self else { return }
            
            if let index = self.postCells.firstIndex(where: { $0.post.id == updatedPost.id }) {
                self.postCells[index].post = updatedPost
            }
        }
        
        postCoordinator.goToPostDetail(postId: post.id, detailVM: detailVM)
    }
    
    func deletePost(at indexSet: IndexSet) async {
        for index in indexSet.sorted(by: >) {
            let postCellVM = postCells[index]
            do {
                try await postRepository.deletePost(postId: postCellVM.post.id)
                postCells.remove(at: index)
            } catch {
                showErrorAlert(title: "Failed to delete", message: error.localizedDescription)
            }
        }
    }
}
