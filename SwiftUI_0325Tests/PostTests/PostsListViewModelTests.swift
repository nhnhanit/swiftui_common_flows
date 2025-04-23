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
    func testLoadPosts_withCachedAndNetworkData() async {
        let mockService = MockPostService()
        mockService.cachedPosts = [Post(userId: 1, id: 1, title: "Cached", body: "Body", isFavorite: false)]
        mockService.fetchedPosts = [Post(userId: 1, id: 2, title: "Fetched", body: "Body", isFavorite: false)]
        
        let mockPostCoordinator = MockPostCoordinator(appCoordinator: MockAppCoordinator())
        let mockAlertManager = MockAlertManager()
        
        let viewModel = PostsListViewModel(
            service: mockService,
            coordinator: mockPostCoordinator,
            alertManager: mockAlertManager
        )

        // Ban đầu từ cache
        #expect(viewModel.postCells.map(\.post.id) == [1])

        // Đợi fetch hoàn tất
        try? await Task.sleep(nanoseconds: 100_000_000)
        #expect(viewModel.postCells.map(\.post.id) == [2])
    }

    @Test
    func testLoadPosts_withNetworkError_showsAlert() async {
        let mockService = MockPostService()
        mockService.shouldThrowOnFetch = true
        
        let mockPostCoordinator = MockPostCoordinator(appCoordinator: MockAppCoordinator())
        let mockAlertManager = MockAlertManager()

        let viewModel = PostsListViewModel(
            service: mockService,
            coordinator: mockPostCoordinator,
            alertManager: mockAlertManager
        )

        try? await Task.sleep(nanoseconds: 100_000_000)
        #expect(mockAlertManager.shownTitle == "Can not load new posts")
    }

    @Test
    func testDeletePost_removesCorrectPost() async {
        let mockService = MockPostService()
        mockService.cachedPosts = [
            Post(userId: 1, id: 1, title: "1", body: "", isFavorite: false),
            Post(userId: 1, id: 2, title: "2", body: "", isFavorite: false)
        ]

        let mockPostCoordinator = MockPostCoordinator(appCoordinator: MockAppCoordinator())
        let mockAlertManager = MockAlertManager()
            
        let viewModel = PostsListViewModel(
            service: mockService,
            coordinator: mockPostCoordinator,
            alertManager: mockAlertManager
        )

        // Đợi async load
        viewModel.loadPosts()
        await viewModel.deletePost(at: IndexSet(integer: 0))

        #expect(viewModel.postCells.map(\.post.id) == [2])
        #expect(mockService.deletedPostIds == [1])
    }
}
