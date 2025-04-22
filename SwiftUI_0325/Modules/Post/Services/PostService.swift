//
//  ProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostServicing {
    func fetchPosts() async throws -> [Post]
    func fetchUser(by postId: String) async throws -> UserInfo
    func fetchComments(by postId: String) async throws -> [Comment]
}

final class PostService: PostServicing {
    private let network: NetworkService

    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }
        
    func fetchPosts() async throws -> [Post] {
        try await network.request(PostAPI.fetchPosts)
    }
    
    func fetchComments(by postId: String) async throws -> [Comment] {
        try await network.request(PostAPI.fetchComments(postId: postId))
    }
    
    func fetchUser(by userId: String) async throws -> UserInfo {
        try await network.request(PostAPI.fetchUser(userId: userId))
    }
}
