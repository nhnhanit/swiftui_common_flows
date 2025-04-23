//
//  PostDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

@MainActor
final class PostDetailViewModel: ObservableObject {
    @Published var post: Post
    private let service: PostServicing
    @Published var userInfo: UserInfo?
    @Published var commentCellViewModels: [CommentCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    var onUpdate: ((Post) -> Void)?
    private var isProcessing = false
    
    init(post: Post, service: PostServicing) {
        self.post = post
        self.service = service
        
        Task {
            await loadDetails()
        }
    }
    
    func toggleFavorite() {
        guard !isProcessing else { return }
        isProcessing = true
        
        let currentFavorite = post.isFavorite
        let newFavoriteState = !post.isFavorite

        Task {
            do {
                var updatedPost = try await service.patchFavorite(postId: post.id, isFavorite: newFavoriteState)
                
#warning("Hardcode updatedPost.isFavorite = true")
                if !currentFavorite {
                    updatedPost.isFavorite = true
                }
                
                post.isFavorite = updatedPost.isFavorite
                onUpdate?(post)
            } catch {
                print("Failed to patch favorite: \(error)")
            }
            isProcessing = false
        }
        
    }
    
    func loadDetails() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let userResponse = try service.fetchUser(by: post.userId)
            async let commentsResponse = try service.fetchPostComments(by: post.id)
            
            let (userResult, commentsResult) = try await (userResponse, commentsResponse)
            isLoading = false
            userInfo = userResult
            commentCellViewModels = commentsResult.map {
                CommentCellViewModel(comment: $0)
            }
        } catch {
            errorMessage = "Failed to load details: \(error.localizedDescription)"
            print(errorMessage!)
        }
        
        isLoading = false
    }
    
}
