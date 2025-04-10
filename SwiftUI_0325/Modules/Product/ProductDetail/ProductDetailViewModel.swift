//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation
import SwiftUI

final class ProductDetailViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    var product: Product // Theo dõi đối tượng ProductModel
    @Published var isLiked: Bool // Cheating to trigger UI update as press button

    init(product: Product, coordinator: ProductCoordinator) {
        self.coordinator = coordinator
        self.product = product
        self.isLiked = product.isLiked
    }
    
    func toggleLike() {
        isLiked.toggle()
        self.product.isLiked.toggle()
    }
}
