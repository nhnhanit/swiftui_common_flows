//
//  PostUseCase.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/4/25.
//

import SwiftUI

protocol PostUseCase {
    @MainActor 
    func loadCachedPostCells() async throws -> [PostCellViewModel]
    
    @MainActor
    func fetchPostCells() async throws -> [PostCellViewModel]
    
    func fetchUser(by postId: Int) async throws -> UserInfo
    func fetchPostComments(by postId: Int) async throws -> [PostComment]
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post
    func deletePost(postId: Int) async throws
}

final class DefaultPostUseCase: PostUseCase {
    
    private let repository: PostRepository
    private var hasLoaded = false

    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func loadCachedPostCells() async throws -> [PostCellViewModel] {
        return repository.loadCachedPosts().map {
            PostCellViewModel(post: $0, postUseCase: self)
        }
    }

    func fetchPostCells() async throws -> [PostCellViewModel] {
        let posts = try await repository.fetchPosts()
        return posts.map {
            PostCellViewModel(post: $0, postUseCase: self)
        }
    }
    
    func deletePost(postId: Int) async throws {
        try await repository.deletePost(postId: postId)
    }
    
    func fetchUser(by postId: Int) async throws -> UserInfo {
        try await repository.fetchUser(by: postId)
    }
    
    func fetchPostComments(by postId: Int) async throws -> [PostComment] {
        try await repository.fetchPostComments(by: postId)
    }
    
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        try await repository.patchFavorite(postId: postId, isFavorite: isFavorite)
    }
    
}
