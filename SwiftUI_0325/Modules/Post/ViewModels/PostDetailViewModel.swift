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
    
    init(post: Post, service: PostServicing) {
        self.post = post
        self.service = service
        
        Task {
            await loadDetails()
        }
    }
    
    func toggleFavorite() {
        post.isFavorite.toggle()
        onUpdate?(post)
    }
    
    func loadDetails() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let userResponse = try service.fetchUser(by: "\(post.userId)")
            async let commentsResponse = try service.fetchComments(by: "\(post.id)")
            
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
