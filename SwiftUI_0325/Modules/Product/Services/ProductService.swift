//
//  ProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

protocol ProductServicing {
    func fetchProducts() async throws -> [Product]
    func fetchShop(shopID: String) async throws -> Shop
    func fetchReviews(productID: String) async throws -> [Review]
}

final class ProductService: ProductServicing {
    private let network: NetworkService

    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }
        
    func fetchProducts() async throws -> [Product] {
        try await network.request(ProductAPI.fetchProducts)
    }

    func fetchShop(shopID: String) async throws -> Shop {
        try await network.request(ProductAPI.fetchShop(shopID: shopID))
    }

    func fetchReviews(productID: String) async throws -> [Review] {
        try await network.request(ProductAPI.fetchReviews(productID: productID))
    }
}
