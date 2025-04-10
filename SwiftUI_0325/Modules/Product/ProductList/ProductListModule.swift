//
//  ProductListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 27/3/25.
//

import SwiftUICore

final class ProductListModule {
    static func build(coordinator: ProductCoordinator) -> ProductListView {
        let productService = ProductListService.shared
        
        return ProductListView(service: productService, coordinator: coordinator)
    }
}
