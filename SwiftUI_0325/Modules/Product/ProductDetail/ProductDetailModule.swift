//
//  ProductDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class ProductDetailModule {
    static func build(product: Product, coordinator: ProductCoordinator) -> ProductDetailView {
        
        return ProductDetailView(product: product, coordinator: coordinator)
    }
}
