//
//  ProductServiceTests.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import Foundation
import Testing
@testable import SwiftUI_0325

struct ProductServiceTests {
    @Test("Fetch products from mock JSON file")
    func testFetchProductsFromJSON() async throws {
        let mockNetwork = MockNetworkService()
        mockNetwork.jsonFileName = "products"

        let service = ProductService(network: mockNetwork)
        let products = try await service.fetchProducts()

        #expect(products.count == 3)
        #expect(products[0].name == "Black Coffee")
    }
    
    @Test("Handle network failure gracefully")
    func testNetworkFailure() async throws {
        let mockNetwork = MockNetworkService()
        mockNetwork.shouldFail = true

        let service = ProductService(network: mockNetwork)

        do {
            _ = try await service.fetchProducts()
            #expect(Bool(false), "Expected failure but got success")
        } catch {
            #expect(true)
        }
    }
}
