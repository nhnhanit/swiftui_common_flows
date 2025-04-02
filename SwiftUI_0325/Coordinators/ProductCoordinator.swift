//
//  ProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

enum ProductRoute: Hashable {
    
    case productDetail(product: Product, viewModel: ProductListViewModel)
    
    // Để enum này conform Hashable, cần bỏ closure/delegate khi so sánh
    static func == (lhs: ProductRoute, rhs: ProductRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.productDetail(p1, _), .productDetail(p2, _)):
            return p1.id == p2.id
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .productDetail(product, _):
            hasher.combine(product.id)
        }
    }
}

final class ProductCoordinator: ObservableObject {
    private weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func goToProductDetail(product: Product, viewModel: ProductListViewModel) {
        if let appCoordinator = appCoordinator {
            appCoordinator.navigate(to: .productRoute(.productDetail(product: product, viewModel: viewModel)))
        } else {
            print("appCoordinator is nil")
        }
    }
}

