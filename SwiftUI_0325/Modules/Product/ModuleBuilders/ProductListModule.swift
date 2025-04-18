//
//  ProductListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//


import SwiftUI

final class ProductListModule {
    static func build(coordinator: ProductCoordinator, alertManager: GlobalAlertManager) -> ProductListView {
        let network = DefaultNetworkService()
        let productService = ProductService(network: network)
        
        return ProductListView(service: productService, coordinator: coordinator, alertManager: alertManager)
    }
}
