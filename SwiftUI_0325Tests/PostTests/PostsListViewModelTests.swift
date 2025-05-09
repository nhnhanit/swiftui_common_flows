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
    
    // MARK: - Tests
    
    @Test("loadPosts - network failure")
    func testLoadPosts_NetworkFailure() async throws {
        let mockNetworkService = MockNetworkService()
        let postLocalDataSource = DefaultPostLocalDataSource()
        let postCoordinator = DefaultPostCoordinator()
        let postRepository = DefaultPostRepository(networkService: mockNetworkService,
                                                   postLocalDataSource: postLocalDataSource)
        let viewModel = PostsListViewModel(postRepository: postRepository, postCoordinator: postCoordinator)

        // Given
        mockNetworkService.shouldFail = true
        
        // When
        viewModel.loadPosts()
        await waitForCompletion(seconds: 0.3)
        
        // Then
        #expect(viewModel.errorTitle != nil)
        #expect(viewModel.errorTitle?.contains("Failed to load posts!") == true)
    }
    
    @Test("loadPosts - network success")
    func testFetchPostsFromNetwork_Success() async throws {
        let mockNetworkService = MockNetworkService()
        let postLocalDataSource = DefaultPostLocalDataSource()
        let postRepository = DefaultPostRepository(networkService: mockNetworkService, postLocalDataSource: postLocalDataSource)
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: postRepository, postCoordinator: postCoordinator)

        // Given
        mockNetworkService.jsonFileName = "MockDataPosts"
        
        // When
        viewModel.loadPosts()
        await waitForCompletion(seconds: 0.3)
        
        #expect(viewModel.postCells.count == 100)
        #expect(viewModel.postCells.first?.post.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
    }

    @Test("deletePost - remove correct post")
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
        await waitForCompletion(seconds: 0.3)
        
        // delete item "Network Post - 2"
        await viewModel.deletePost(at: IndexSet(integer: 1))
        
        // Delete item 2, keep items 1 and 3
        #expect(viewModel.postCells.first?.post.title == "Network Post - 1")
        #expect(viewModel.postCells.last?.post.title == "Network Post - 3")
    }
    
    @Test("selectPost - navigate correct post")
    func testSelectPost_NavigateCorrectPost() async {
        // Given
        let mockPost = Post(userId: 3, id: 3, title: "Network Post - 3", body: "", isFavorite: false)
        let mockPostRepository = MockPostRepository()
        let mockPostCoordinator = MockPostCoordinator()
        
        let viewModel = PostsListViewModel(postRepository: mockPostRepository, postCoordinator: mockPostCoordinator)
        
        // When
        viewModel.selectPost(mockPost)
        
        #expect(mockPostCoordinator.navigatedToPostId == 3)
        #expect(mockPostCoordinator.passedViewModel?.post.id == 3)
    }

}
