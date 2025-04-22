//
//  ProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostServicing {
    func loadCachedPosts() -> [Post]
    func fetchPosts() async throws -> [Post]
    func fetchUser(by postId: String) async throws -> UserInfo
    func fetchComments(by postId: String) async throws -> [Comment]
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post
}

final class PostService: PostServicing {
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
    
    func fetchComments(by postId: String) async throws -> [Comment] {
        try await network.request(PostAPI.fetchComments(postId: postId))
    }
    
    func fetchUser(by userId: String) async throws -> UserInfo {
        try await network.request(PostAPI.fetchUser(userId: userId))
    }
    
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        try await network.request(PostAPI.patchFavorite(postId: postId, isFavorite: isFavorite))
    }
}
