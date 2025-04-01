//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    private let coordinator: AppCoordinator
    var product: Product
    @Published var isLiked: Bool

    init(product: Product, coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.product = product
        self.isLiked = product.isLiked
    }
    
    func toggleLike() {
        isLiked.toggle()
        product.isLiked = isLiked // Cập nhật giá trị trong product
    }
}
