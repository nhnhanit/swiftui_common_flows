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
    
    @Test
    func testLoadPosts_loadsCachedThenNetwork() async {
        // Given
        let mockService = MockPostService()
        mockService.cachedPosts = [
            Post(userId: 1, id: 1, title: "Cached Post - 1", body: "", isFavorite: false)
        ]
        mockService.fetchedPosts = [
            Post(userId: 1, id: 1, title: "Network Post - 1", body: "", isFavorite: false),
            Post(userId: 2, id: 2, title: "Network Post - 2", body: "", isFavorite: false)
        ]

        let viewModel = PostsListViewModel(
            service: mockService,
            coordinator: MockPostCoordinator(appCoordinator: MockAppCoordinator()),
            alertManager: MockAlertManager()
        )

        // When
        viewModel.loadPosts()
        
        // First cached posts
        #expect(viewModel.postCells.count == 1)
        #expect(viewModel.postCells.first?.post.title == "Cached Post - 2")
        
        // Then fetch posts
        try? await Task.sleep(nanoseconds: 300_000_000)
        #expect(viewModel.postCells.count == 2)
        #expect(viewModel.postCells.first?.post.title == "Network Post - 2")
        #expect(viewModel.isLoading == false)
    }

    @Test
    func testDeletePost_removesCorrectPost() async {
        // Given
        let mockService = MockPostService()
        mockService.cachedPosts = [
            Post(userId: 1, id: 1, title: "Cache Post - 1", body: "", isFavorite: false)
        ]
        mockService.fetchedPosts = [
            Post(userId: 1, id: 1, title: "Network Post - 1", body: "", isFavorite: false),
            Post(userId: 2, id: 2, title: "Network Post - 2", body: "", isFavorite: false),
            Post(userId: 3, id: 3, title: "Network Post - 3", body: "", isFavorite: false),
        ]
        
        let mockCoordinator = MockPostCoordinator(appCoordinator: MockAppCoordinator())
        let mockAlertManager = MockAlertManager()
        
        let viewModel = PostsListViewModel(
            service: mockService,
            coordinator: mockCoordinator,
            alertManager: mockAlertManager
        )
        
        // When
        viewModel.loadPosts()
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        // delete item "Network Post - 2"
        await viewModel.deletePost(at: IndexSet(integer: 1))
        DLog("deleted post", viewModel.postCells.count)
        
        // Then
        #expect(viewModel.postCells.count == 1)
        #expect(mockService.deletedPostIds.first == 2)
        #expect(viewModel.postCells.first?.post.title == "Network Post - 11")
        #expect(viewModel.postCells.last?.post.title == "Network Post - 33")
    }

}
