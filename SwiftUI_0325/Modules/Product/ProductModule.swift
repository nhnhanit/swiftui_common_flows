//
//  ProductModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 27/3/25.
//

final class ProductModule {
    static func build(coordinator: AppCoordinator) -> ProductView {
        let productService = ProductService.shared
        let viewModel = ProductViewModel(service: productService, coordinator: coordinator)
        
        return ProductView(viewModel: viewModel)
    }
}
