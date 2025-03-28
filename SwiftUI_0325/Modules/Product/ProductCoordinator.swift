//
//  ProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

class ProductCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    
    func goToDetail(productID: Int) {
        navigationPath.append(productID)
    }
}

enum ProductRoute: Hashable {
    case productDetail(productID: Int)
}

