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
    private let productService: ProductServicing
    @Published var shop: Shop?
    @Published var reviewCellViewModels: [ReviewCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    var onUpdate: ((Product) -> Void)?
    
    init(product: Product, service: ProductServicing) {
        self.product = product
        self.productService = service
        
        Task {
            await loadDetails()
        }
    }
    
    func toggleLike() {
        //        service.toggleLike(for: product)
        product.isLiked.toggle()
        onUpdate?(product)
    }
    
    func loadDetails() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let shopResponse = try productService.fetchShop(shopID: "\(product.id)")
            async let reviewsResponse = try productService.fetchReviews(productID: "\(product.id)")
            
            let (shopResult, reviewsResult) = try await (shopResponse, reviewsResponse)
            isLoading = false
            shop = shopResult
            reviewCellViewModels = reviewsResult.map {
                ReviewCellViewModel(review: $0)
            }
        } catch {
            errorMessage = "Failed to load details: \(error.localizedDescription)"
            print(errorMessage!)
        }
        
        isLoading = false
    }
    
}
