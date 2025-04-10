//
//  ProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class ProductCoordinator: ObservableObject {
    private weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func goToProductDetail(cellVM: ProductCellViewModel) {
        if let appCoordinator = appCoordinator {
            appCoordinator.navigate(to: .productRoute(.productDetail(cellVM: cellVM)))
        } else {
            print("appCoordinator is nil")
        }
    }
}

enum ProductRoute: Hashable {
    
    case productDetail(cellVM: ProductCellViewModel)
    
    // Để enum này conform Hashable, cần bỏ closure/delegate khi so sánh
    static func == (lhs: ProductRoute, rhs: ProductRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.productDetail(p1), .productDetail(p2)):
            return p1.id == p2.id
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .productDetail(product):
            hasher.combine(product.id)
        }
    }
}


