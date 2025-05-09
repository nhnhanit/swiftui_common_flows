//
//  PostRepository.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostRepository {
    func loadCachedPosts(limit: Int?) -> [Post]
    func fetchPosts() async throws -> [Post]
    func fetchUser(by postId: Int) async throws -> UserInfo
    func fetchPostComments(by postId: Int) async throws -> [PostComment]
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post
    func deletePost(postId: Int) async throws
}

final class DefaultPostRepository: PostRepository {
    private let networkService: NetworkService
    private let postLocalDataSource: PostLocalDataSource
    
    init(networkService: NetworkService, postLocalDataSource: PostLocalDataSource) {
        self.networkService = networkService
        self.postLocalDataSource = postLocalDataSource
    }
    
    func loadCachedPosts(limit: Int?) -> [Post] {
        let cached = postLocalDataSource.loadCachedPosts()
        let limitedCached = Array(cached.prefix(limit ?? Int.max))
        return limitedCached
    }
    
    func fetchPosts() async throws -> [Post] {
        let posts: [Post] = try await networkService.request(PostAPI.fetchPosts)
        try postLocalDataSource.save(posts: posts)
        return posts
    }
    
    func fetchPostComments(by postId: Int) async throws -> [PostComment] {
        try await networkService.request(PostAPI.fetchComments(postId: postId))
    }
    
    func fetchUser(by userId: Int) async throws -> UserInfo {
        try await networkService.request(PostAPI.fetchUser(userId: userId))
    }
    
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        try await networkService.request(PostAPI.patchFavorite(postId: postId, isFavorite: isFavorite))
    }

    func deletePost(postId: Int) async throws {
        _ = try await networkService.request(PostAPI.deletePost(postId: postId)) as EmptyResponse
    }

}
