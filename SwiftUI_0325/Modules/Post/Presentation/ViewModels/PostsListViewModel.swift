//
//  PostsListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

@MainActor
final class PostsListViewModel: ObservableObject {
    //    private let postService: PostServicing
    private let postUseCase: PostUseCase
    private let coordinator: PostCoordinator
    private let alertManager: GlobalAlertManager
    
    @Published var postCells: [PostCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentTask: Task<Void, Never>?
    var hasLoaded = false
    
    init(postUseCase: PostUseCase, coordinator: PostCoordinator, alertManager: GlobalAlertManager) {
        print("🔁 PostsListViewModel INIT")
        
        self.postUseCase = postUseCase
        self.coordinator = coordinator
        self.alertManager = alertManager
    }
    
    deinit {
        print("❌ DEINIT PostsListViewModel")
    }
    
    func cancelLoading() {
        currentTask?.cancel()
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
        
        // 2️⃣ Then try refreshing from network
        currentTask = Task { [weak self] in
            guard let self else { return }
            
            do {
                let cached = try await postUseCase.loadCachedPostCells()
                if !cached.isEmpty {
                    postCells = cached
                }
                await fetchPostsFromNetwork()
            } catch {
                print("⚠️ Failed to load cached posts: \(error)")
                await fetchPostsFromNetwork()
            }
            self.currentTask = nil
        }
    }
    
    func fetchPostsFromNetwork() async {
        isLoading = true
        
        do {
            let freshPosts = try await postUseCase.fetchPostCells()
            postCells = freshPosts
        } catch is CancellationError {
            print("❌ Task was cancelled intentionally.")
        } catch {
            self.showErrorAlert(title: "Can not load new posts", message: error.localizedDescription)
        }
        
        isLoading = false
    }
    
    private func showErrorAlert(title: String, message: String) {
        alertManager.showAlert(
            title: title,
            message: message,
            primary: .init(title: "OK", role: .cancel)
        )
    }
    
    func selectPost(_ post: Post) {
        let detailVM = PostDetailViewModel(post: post, postUseCase: postUseCase)
        
        // 👇 Callback from Detail to List
        detailVM.onUpdate = { [weak self] updatedPost in
            guard let self else { return }
            
            if let index = self.postCells.firstIndex(where: { $0.post.id == updatedPost.id }) {
                self.postCells[index].post = updatedPost
            }
        }
        
        coordinator.goToPostDetail(postId: post.id, detailVM: detailVM)
    }
    
    func deletePost(at indexSet: IndexSet) async {
        for index in indexSet.sorted(by: >) {
            let postCellVM = postCells[index]
            do {
                try await postUseCase.deletePost(postId: postCellVM.post.id)
                postCells.remove(at: index)
            } catch {
                showErrorAlert(title: "Failed to delete", message: error.localizedDescription)
            }
        }
    }
}
