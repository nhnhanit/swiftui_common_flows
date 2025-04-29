//
//  PostRepository.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostRepository {
    func loadCachedPosts() -> [Post]
    func fetchPosts() async throws -> [Post]
    func fetchUser(by postId: Int) async throws -> UserInfo
    func fetchPostComments(by postId: Int) async throws -> [PostComment]
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post
    func deletePost(postId: Int) async throws
}

final class DefaultPostRepository: PostRepository {
    private let network: NetworkService
    private let localStore: PostLocalStoring
    
    init(
        network: NetworkService = DefaultNetworkService(),
        localStore: PostLocalStoring = PostLocalStore()
    ) {
        self.network = network
        self.localStore = localStore
    }
    
    func loadCachedPosts() -> [Post] {
        return localStore.loadCachedPosts()
    }
    
    func fetchPosts() async throws -> [Post] {
        let posts: [Post] = try await network.request(PostAPI.fetchPosts)
        try localStore.save(posts: posts)
        return posts
    }
    
    func fetchPostComments(by postId: Int) async throws -> [PostComment] {
        try await network.request(PostAPI.fetchComments(postId: postId))
    }
    
    func fetchUser(by userId: Int) async throws -> UserInfo {
        try await network.request(PostAPI.fetchUser(userId: userId))
    }
    
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        try await network.request(PostAPI.patchFavorite(postId: postId, isFavorite: isFavorite))
    }

    func deletePost(postId: Int) async throws {
        _ = try await network.request(PostAPI.deletePost(postId: postId)) as EmptyResponse
    }

}
