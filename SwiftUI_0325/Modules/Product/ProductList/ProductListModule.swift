//
//  ProductListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 27/3/25.
//

final class ProductListModule {
    static func build(coordinator: AppCoordinator) -> ProductListView {
        let productService = ProductListService.shared
        let viewModel = ProductListViewModel(service: productService, coordinator: coordinator)
        
        return ProductListView(viewModel: viewModel)
    }
}
