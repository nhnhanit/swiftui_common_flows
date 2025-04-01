//
//  ProductDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class ProductDetailModule {
    static func build(productId: String, coordinator: AppCoordinator) -> ProductDetailView {
        let viewModel = ProductDetailViewModel(coordinator: coordinator, productId: productId)
        
        return ProductDetailView(viewModel: viewModel)
    }
}
