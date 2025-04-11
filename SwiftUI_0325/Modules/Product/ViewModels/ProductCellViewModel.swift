//
//  ProductCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class ProductCellViewModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var product: Product
    private let service: ProductService

    init(product: Product, service: ProductService) {
        self.product = product
        self.service = service
    }

    func toggleLike() {
//        service.toggleLike(for: product)
        product.isLiked.toggle()
    }
}
