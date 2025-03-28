//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    let productId: Int

    init(productId: Int, coordinator: ProductCoordinator) {
        self.productId = productId
        self.coordinator = coordinator
    }
}
