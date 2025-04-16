//
//  MockProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import Testing
@testable import SwiftUI_0325
import Foundation

@MainActor
final class MockProductService: ProductServicing {
    var productsToReturn: [Product] = []
    var shopToReturn: Shop = Shop(id: "Default ShopID", name: "Default Shop", address: "Default Shop Adress")
    var reviewsToReturn: [Review] = []
    
    var shouldThrowError = false
    var errorToThrow: Error = URLError(.badServerResponse)
    
    func fetchProducts() async throws -> [Product] {
        if shouldThrowError {
            throw errorToThrow
        }
        return productsToReturn
    }
    
    func fetchShop(shopID: String) async throws -> Shop {
        if shouldThrowError {
            throw errorToThrow
        }
        return shopToReturn
    }
    
    func fetchReviews(productID: String) async throws -> [Review] {
        if shouldThrowError {
            throw errorToThrow
        }
        return reviewsToReturn
    }
}
