//
//  ProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

final class ProductService {
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
