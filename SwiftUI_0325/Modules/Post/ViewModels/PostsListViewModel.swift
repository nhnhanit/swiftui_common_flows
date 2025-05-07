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
    private let defaultPostRepository = DefaultPostRepository(network: DefaultNetworkService(),
                                                              postLocalStore: DefaultPostLocalStore())
    private let postCoordinator: PostCoordinator
    @Published var postCells: [PostCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    var hasLoaded = false
    
    private var currentTask: Task<Void, Never>?
    
    init(postRepository: PostRepository, postCoordinator: PostCoordinator) {
        print("🔁 PostsListViewModel INIT")
        
        self.postRepository = postRepository
        self.postCoordinator = postCoordinator
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
        guard currentTask == nil else { return }

        currentTask = Task { [weak self] in
            guard let self else { return }
            isLoading = true
            defer { isLoading = false; currentTask = nil }

            do {
                let cached = try await postRepository.getCachedThenRefreshPosts(limit: 3) { [weak self] fresh in
                    guard let self else { return }
                    
                    self.postCells = fresh.map {
                        PostCellViewModel(post: $0, postRepository: self.postRepository)
                    }
                }

                postCells = cached.map {
                    PostCellViewModel(post: $0, postRepository: self.postRepository)
                }
            } catch {
                showErrorAlert(title: "Failed to load posts", message: error.localizedDescription)
            }
        }
    }
    
    func cancelLoading() {
        currentTask?.cancel()
    }
    
    private func showErrorAlert(title: String, message: String) {
        EnvironmentContainer.appAlertManager.showAlert(
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
