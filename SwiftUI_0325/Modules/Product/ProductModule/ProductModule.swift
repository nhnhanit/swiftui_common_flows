//
//  ProductModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 27/3/25.
//


final class ProductModule {
    static func build() -> ProductView {
        let productService = ProductService.shared
        let coordinator = ProductCoordinator()
        let viewModel = ProductViewModel(service: productService, coordinator: coordinator) // Inject service into ViewModel
        
        return ProductView(viewModel: viewModel, coordinator: coordinator) // Inject ViewModel into View
    }
}
