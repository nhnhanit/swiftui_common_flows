//
//  ProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

protocol ProductServiceProtocol {
    func fetchProducts() -> [Product]
    func toggleLike(for product: Product)
    func fetchReviews(for product: Product) async throws -> [Review]
    func fetchShop(for product: Product) async throws -> Shop
}

final class ProductService: ProductServiceProtocol {
    static let shared = ProductService()
    private init() {}

    private var products: [Product] = [
        Product(id: UUID(), name: "iPhone 15", isLiked: false),
        Product(id: UUID(), name: "MacBook Pro", isLiked: true)
    ]

    func fetchProducts() -> [Product] {
        products
    }

    func toggleLike(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isLiked.toggle()
        }
    }
    
    func fetchReviews(for product: Product) async throws -> [Review] {
        try await Task.sleep(nanoseconds: 500_000_000) // Simulate delay
        return [
            Review(id: UUID(), userName: "Alice", description: "Great product!"),
            Review(id: UUID(), userName: "Bob", description: "Not bad.")
        ]
    }

    func fetchShop(for product: Product) async throws -> Shop {
        try await Task.sleep(nanoseconds: 500_000_000) // Simulate delay
        return Shop(name: "Apple Store", address: "123 Main St")
    }
}
