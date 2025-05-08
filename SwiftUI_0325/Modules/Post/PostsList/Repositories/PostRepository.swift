//
//  PostRepository.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostRepository {
    
    // this is an example of business logic
    func getCachedThenRefreshPosts(
        limit: Int?,
        onRefresh: @MainActor @escaping ([Post]) -> Void,
        onError: @escaping (Error) -> Void
    ) async throws -> [Post]
    
    func loadCachedPosts() -> [Post]
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
    
    func getCachedThenRefreshPosts(
        limit: Int?,
        onRefresh: @MainActor @escaping ([Post]) -> Void,
        onError: @escaping (Error) -> Void
    ) async throws -> [Post] {
        
        // 1️⃣ Return cached first
        let cached = postLocalDataSource.loadCachedPosts()
        let limitedCached = Array(cached.prefix(limit ?? Int.max))

        // 2️⃣ In background, refresh and callback
        Task {
            do {
                let fresh = try await fetchPosts()
                await onRefresh(fresh)
            } catch {
                onError(error) // 👈 propagate error to ViewModel
            }
        }

        return limitedCached
    }
    
    func loadCachedPosts() -> [Post] {
        return postLocalDataSource.loadCachedPosts()
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
