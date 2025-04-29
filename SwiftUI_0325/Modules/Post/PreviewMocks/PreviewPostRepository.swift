//
//  PreviewPostRepository.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//

// MockPostRepository.swift

import Foundation

final class PreviewPostRepository: PostRepository {
    
    func fetchPostsFromNetwork() async throws -> [Post] {
        SamplePosts.posts
    }

    func loadCachedPosts() -> [Post] {
        SamplePosts.posts
    }

    func fetchPosts() async throws -> [Post] {
        SamplePosts.posts
    }
    
    func fetchUser(by postId: Int) async throws -> UserInfo {
        return SamplePosts.userInfo
    }
    
    func fetchPostComments(by postId: Int) async throws -> [PostComment] {
        return SamplePosts.postComments
    }
    
    func patchFavorite(postId: Int, isFavorite: Bool) async throws -> Post {
        return SamplePosts.post
    }
    
    func deletePost(postId: Int) async throws {
        
    }
}
