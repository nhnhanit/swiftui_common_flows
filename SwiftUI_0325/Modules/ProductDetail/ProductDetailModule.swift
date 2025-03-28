//
//  ProductDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class ProductDetailModule {
    static func build(productId: Int, coordinator: ProductCoordinator) -> ProductDetailView {
        let viewModel = ProductDetailViewModel(productId: productId, coordinator: coordinator)
        return ProductDetailView(viewModel: viewModel)
    }
}
