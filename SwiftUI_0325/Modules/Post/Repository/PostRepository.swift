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
    private let postLocalStore: PostLocalStore
    
    init(network: NetworkService, postLocalStore: PostLocalStore) {
        self.network = network
        self.postLocalStore = postLocalStore
    }
    
    func loadCachedPosts() -> [Post] {
        return postLocalStore.loadCachedPosts()
    }
    
    func fetchPosts() async throws -> [Post] {
        let posts: [Post] = try await network.request(PostAPI.fetchPosts)
        try postLocalStore.save(posts: posts)
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
