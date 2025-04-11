//
//  ProductListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//


import SwiftUI

final class ProductListModule {
    static func build(coordinator: ProductCoordinator) -> ProductListView {
        let service = ProductService.shared
        
        return ProductListView(service: service, coordinator: coordinator)
    }
}
