//
//  MockPostService+Coordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 23/4/25.
//

import Testing
@testable import SwiftUI_0325
import Foundation

final class MockPostRepository: PostRepository {
    var cachedPosts: [Post] = []
    var fetchedPosts: [Post] = []
    var deletedPostIds: [Int] = []
    var shouldThrowOnFetch = false
    var shouldThrowOnDelete = false
    
    func loadCachedPosts() -> [Post] {
        cachedPosts
    }
    
    func fetchPosts() async throws -> [Post] {
        if shouldThrowOnFetch {
            throw URLError(.notConnectedToInternet)
        }
        return fetchedPosts
    }
    
    func deletePost(postId: Int) async throws {
        if shouldThrowOnDelete {
            throw URLError(.cannotRemoveFile)
        }
        deletedPostIds.append(postId)
    }
    
    func fetchPostComments(by postId: Int) async throws -> [PostComment] { [] }
    func fetchUser(by postId: Int) async throws -> UserInfo { .init(id: 1, name: "Mock", email: "", phone: "123123") }
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        .init(userId: 1, id: postId, title: "Fav", body: "Fav", isFavorite: isFavorite)
    }
}

final class MockPostCoordinator: PostCoordinator {
    var navigatedToPostId: Int?
    
    func goToPostDetail(postId: Int, detailVM: PostDetailViewModel) {
        navigatedToPostId = postId
    }
}
