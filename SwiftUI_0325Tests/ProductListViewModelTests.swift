//
//  ProductListViewModelTests.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import Foundation
import Testing
@testable import SwiftUI_0325

@MainActor
struct ProductListViewModelTests {
    
    @Test("Fetch products successfully updates view model")
    func testFetchProductsSuccess() async throws {
        let mockService = MockProductService()
        mockService.productsToReturn = [
            Product(id: "1", name: "Coffee", isLiked: false)
        ]
        let coordinator = ProductCoordinator(appCoordinator: MockAppCoordinator())
        
        // Act
        let viewModel = ProductListViewModel(service: mockService, coordinator: coordinator)
        try? await Task.sleep(nanoseconds: 200_000_000) // Đợi init
        
        // Assert
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.productCells.count == 1)
        #expect(viewModel.productCells[0].product.name == "Coffee")
    }
    
    @Test("Fetch products fails and sets errorMessage")
    func testFetchProductsFailure() async throws {
        let mockService = MockProductService()
        mockService.shouldThrowError = true
        let coordinator = ProductCoordinator(appCoordinator: MockAppCoordinator())

        let viewModel = ProductListViewModel(service: mockService, coordinator: coordinator)
        try? await Task.sleep(nanoseconds: 200_000_000)

        #expect(viewModel.productCells.isEmpty)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage?.contains("Failed to load products") == true)
    }
    
    @Test("Selecting product triggers navigation")
    func testSelectProductNavigatesToDetail() async throws {
        let product = Product(id: "42", name: "Laptop", isLiked: true)
        let mockService = MockProductService()
        mockService.productsToReturn = [product]

        let mockAppCoordinator = MockAppCoordinator()
        let productCoordinator = ProductCoordinator(appCoordinator: mockAppCoordinator)

        let viewModel = ProductListViewModel(service: mockService, coordinator: productCoordinator)
        try? await Task.sleep(nanoseconds: 200_000_000)

        viewModel.selectProduct(product)

        guard let route = mockAppCoordinator.lastNavigatedRoute else {
            #expect(Bool(false), "Expected navigation to productRoute, but got nil")
            return
        }

        guard case let .productRoute(.productDetail(productID, _)) = route else {
            #expect(Bool(false), "Expected .productRoute.productDetail but got something else")
            return
        }

        #expect(productID == "42")
    }
}
