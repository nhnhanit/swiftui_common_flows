//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    private let coordinator: AppCoordinator
    let productId: String

    init(coordinator: AppCoordinator, productId: String) {
        self.coordinator = coordinator
        self.productId = productId
    }
}
