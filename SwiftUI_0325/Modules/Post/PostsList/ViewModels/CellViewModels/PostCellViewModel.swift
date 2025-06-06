//
//  PostCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class PostCellViewModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var post: Post
    private let postRepository: PostRepository
    private var isProcessing = false

    init(post: Post, postRepository: PostRepository) {
        self.post = post
        self.postRepository = postRepository
    }
    
    func toggleFavorite() {
        guard !isProcessing else { return }
        isProcessing = true
        
        let currentFavorite = post.isFavorite
        let newFavoriteState = !post.isFavorite

        Task {
            do {
                var updatedPost = try await postRepository.patchFavorite(postId: post.id, isFavorite: newFavoriteState)
                
#warning("Hardcode updatedPost.isFavorite = true")
                if !currentFavorite {
                    updatedPost.isFavorite = true
                }
                
                post.isFavorite = updatedPost.isFavorite
            } catch {
                print("Failed to patch favorite: \(error)")
            }
            isProcessing = false
        }
    }

}
