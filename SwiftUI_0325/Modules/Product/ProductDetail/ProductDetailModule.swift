//
//  ProductDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class ProductDetailModule {
    static func build(product: Product, coordinator: ProductCoordinator, delegate: ProductDetailDelegate?) -> ProductDetailView {
        let viewModel = ProductDetailViewModel(product: product, coordinator: coordinator, delegate: delegate)
        
        return ProductDetailView(viewModel: viewModel)
    }
}


