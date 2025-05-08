//
//  PostsListViewModelTests.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 23/4/25.
//

import Testing
@testable import SwiftUI_0325
import Foundation

@MainActor
struct PostsListViewModelTests {
    
    @Test("Fetch posts from network - failure")
    func testFetchPostsFromNetwork_NetworkFailure() async throws {
        let mockNetworkService = MockNetworkService()
        
        // Given
        mockNetworkService.shouldFail = true
        
        let postLocalDataSource = DefaultPostLocalDataSource()
        let postRepository = DefaultPostRepository(networkService: mockNetworkService,
                                                   postLocalDataSource: postLocalDataSource)
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: postRepository, postCoordinator: postCoordinator)

        // When
        viewModel.loadPosts()
               
        // Then
        #expect(viewModel.postCells.isEmpty)
        #expect(viewModel.isLoading == false)
    }
    
    @Test("Fetch posts from network - success")
    func testFetchPostsFromNetwork_Success() async throws {
        let mockNetworkService = MockNetworkService()
        
        // Given
        mockNetworkService.jsonFileName = "MockDataPosts"

        let postLocalDataSource = DefaultPostLocalDataSource()
        let postRepository = DefaultPostRepository(networkService: mockNetworkService, postLocalDataSource: postLocalDataSource)
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: postRepository, postCoordinator: postCoordinator)

        // When
        viewModel.loadPosts()
        
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        #expect(viewModel.postCells.count == 100)
        #expect(viewModel.postCells.first?.post.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
    }

    @Test("Delete post - remove correct post")
    func testDeletePost_removesCorrectPost() async {
        // Given
        let mockPostRepository = MockPostRepository()
        mockPostRepository.fetchedPosts = [
            Post(userId: 1, id: 1, title: "Network Post - 1", body: "", isFavorite: false),
            Post(userId: 2, id: 2, title: "Network Post - 2", body: "", isFavorite: false),
            Post(userId: 3, id: 3, title: "Network Post - 3", body: "", isFavorite: false)
        ]
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: mockPostRepository, postCoordinator: postCoordinator)
        
        // When
        viewModel.loadPosts()
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        // delete item "Network Post - 2"
        await viewModel.deletePost(at: IndexSet(integer: 1))
        
        // Delete item 2, keep items 1 and 3
        #expect(viewModel.postCells.first?.post.title == "Network Post - 1")
        #expect(viewModel.postCells.last?.post.title == "Network Post - 3")
    }
    
    @Test("Select post - navigate correct post")
    func testSelectPost_NavigateCorrectPost() async {
        // Given
        let mockPost = Post(userId: 3, id: 3, title: "Network Post - 3", body: "", isFavorite: false)
        let mockPostRepository = MockPostRepository()
        let mockPostCoordinator = MockPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: mockPostRepository, postCoordinator: mockPostCoordinator)
        
        // When
        viewModel.selectPost(mockPost)
        
        #expect(mockPostCoordinator.navigatedToPostId == 3)
    }

}
