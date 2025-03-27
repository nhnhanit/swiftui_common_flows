//
//  ProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import SwiftUI

class ProductCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    
    func start() {
        // This can be used to show an initial screen
    }
    
    func goToDetail(product: Product) {
        navigationPath.append(product)
    }
}
