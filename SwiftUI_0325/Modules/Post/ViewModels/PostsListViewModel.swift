//
//  PostsListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

@MainActor
final class PostsListViewModel: ObservableObject {
    private let postService: PostServicing
    private let coordinator: PostCoordinator
    @Published var postCells: [PostCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentTask: Task<Void, Never>?
    private let alertManager: GlobalAlertManager
    
    init(service: PostServicing, coordinator: PostCoordinator, alertManager: GlobalAlertManager) {
        print("🔁 PostsListViewModel INIT")
        
        self.postService = service
        self.coordinator = coordinator
        self.alertManager = alertManager
        
        loadPosts()
    }
    
    deinit {
        print("❌ DEINIT PostsListViewModel")
    }
    
    func loadPosts() {
        // 🔒 Prevent multiple calls
        guard currentTask == nil else {
            print("⏳ Already fetching posts...")
            return
        }
        
        currentTask = Task { [weak self] in
            guard let self else { return }
            await fetchPosts()
            self.currentTask = nil
        }
    }
    
    func cancelLoading() {
        currentTask?.cancel()
    }
    
    private func fetchPosts() async {
        isLoading = true
        
        do {
            postCells = try await postService.fetchPosts().map {
                PostCellViewModel(post: $0, service: postService)
            }
        } catch is CancellationError {
            print("❌ Task was cancelled intentionally.")
        }
        catch {
            self.showErrorAlert(title: "Call networking error", message: error.localizedDescription)
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

    @MainActor func selectPost(_ post: Post) {
        let detailVM = PostDetailViewModel(post: post, service: postService)
        
        // 👇 Callback from Detail to List
        detailVM.onUpdate = { [weak self] updatedPost in
            guard let self else { return }
            if let index = self.postCells.firstIndex(where: { $0.post.id == updatedPost.id }) {
                self.postCells[index].post = updatedPost
            }
        }
        
        coordinator.goToPostDetail(postId: post.id, detailVM: detailVM)
    }
}
