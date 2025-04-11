//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var shop: Shop?
    @Published var reviewCellViewModels: [ReviewCellViewModel] = []
    var onUpdate: ((Product) -> Void)?
    private let service: ProductServiceProtocol

    init(product: Product, service: ProductServiceProtocol) {
        self.product = product
        self.service = service
        Task {
            await loadDetails()
        }
    }

    func toggleLike() {
        service.toggleLike(for: product)
        product.isLiked.toggle()
        onUpdate?(product)
    }

    func loadDetails() async {
        do {
            async let reviews = try service.fetchReviews(for: product)
            async let shop = try service.fetchShop(for: product)

            let (fetchedReviews, fetchedShop) = try await (reviews, shop)
            
            self.shop = fetchedShop
            self.reviewCellViewModels = fetchedReviews.map {
                ReviewCellViewModel(review: $0)
            }
        } catch {
            print("Failed to load product details: \(error)")
        }
    }

}
