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
        let mockNetwork = MockNetworkService()
        mockNetwork.shouldFail = true

        let mockAlertManager = MockAlertManager()
        let postRepository = DefaultPostRepository(network: mockNetwork)
        let viewModel = PostsListViewModel(
            postRepository: postRepository,
            coordinator: MockPostCoordinator(appCoordinator: MockAppCoordinator()),
            alertManager: mockAlertManager
        )

        // When
        await viewModel.fetchPostsFromNetwork()
               
        // Then
        #expect(viewModel.postCells.isEmpty)
        #expect(viewModel.isLoading == false)
        DLog(mockAlertManager.shownTitle)
        #expect(mockAlertManager.shownTitle == "Can not load new posts")
    }
    
    @Test("Fetch posts from network - success")
    func testFetchPostsFromNetwork_Success() async throws {
        let mockNetwork = MockNetworkService()
        mockNetwork.jsonFileName = "MockDataPosts"

        let postRepository = DefaultPostRepository(network: mockNetwork)
        let viewModel = PostsListViewModel(
            postRepository: postRepository,
            coordinator: MockPostCoordinator(appCoordinator: MockAppCoordinator()),
            alertManager: MockAlertManager()
        )

        // When
        await viewModel.fetchPostsFromNetwork()
        
        // First cached posts
        #expect(viewModel.postCells.count == 100)
        #expect(viewModel.postCells.first?.post.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")

    }
    
    @Test("Load posts - load cached first, then load network")
    func testLoadPosts_loadsCachedThenNetwork() async {
        // Given
        let mockPostRepository = MockPostRepository()
        mockPostRepository.cachedPosts = [
            Post(userId: 1, id: 1, title: "Cached Post - 1", body: "", isFavorite: false)
        ]
        mockPostRepository.fetchedPosts = [
            Post(userId: 1, id: 1, title: "Network Post - 1", body: "", isFavorite: false),
            Post(userId: 2, id: 2, title: "Network Post - 2", body: "", isFavorite: false)
        ]

        let viewModel = PostsListViewModel(
            postRepository: mockPostRepository,
            coordinator: MockPostCoordinator(appCoordinator: MockAppCoordinator()),
            alertManager: MockAlertManager()
        )

        // When
        viewModel.loadPosts()
        
        // First, load from cached: 1 item
        #expect(viewModel.postCells.count == 1)
        #expect(viewModel.postCells.first?.post.title == "Cached Post - 1")
        
        // Then, fetch from network: 3 items
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        #expect(viewModel.postCells.count == 2)
        #expect(viewModel.postCells.last?.post.title == "Network Post - 2")
        #expect(viewModel.isLoading == false)
    }

    @Test("Delete post - remove correct post")
    func testDeletePost_removesCorrectPost() async {
        // Given
        let mockPostRepository = MockPostRepository()
        mockPostRepository.cachedPosts = [
            Post(userId: 1, id: 1, title: "Cache Post - 1", body: "", isFavorite: false)
        ]
        mockPostRepository.fetchedPosts = [
            Post(userId: 1, id: 1, title: "Network Post - 1", body: "", isFavorite: false),
            Post(userId: 2, id: 2, title: "Network Post - 2", body: "", isFavorite: false),
            Post(userId: 3, id: 3, title: "Network Post - 3", body: "", isFavorite: false),
        ]
        
        let mockCoordinator = MockPostCoordinator(appCoordinator: MockAppCoordinator())
        let mockAlertManager = MockAlertManager()
        
        let viewModel = PostsListViewModel(
            postRepository: mockPostRepository,
            coordinator: mockCoordinator,
            alertManager: mockAlertManager
        )
        
        // When
        viewModel.loadPosts()
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        // delete item "Network Post - 2"
        await viewModel.deletePost(at: IndexSet(integer: 1))
        
        // Delete item 2, keep items 1 and 3
        #expect(viewModel.postCells.first?.post.title == "Network Post - 111")
        #expect(viewModel.postCells.last?.post.title == "Network Post - 333")
    }

}
