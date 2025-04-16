//
//  ProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class ProductCoordinator: ObservableObject {
    private weak var appCoordinator: (Navigatable & AlertPresentable)?
    
    init(appCoordinator: (Navigatable & AlertPresentable)) {
        self.appCoordinator = appCoordinator
    }
    
    func showErrorAlert(title: String, message: String) {
        appCoordinator?.alertManager.showAlert(
            title: title,
            message: message,
            primary: .init(title: "OK", role: .cancel)
        )
    }
    
    func goToProductDetail(productID: String, detailVM: ProductDetailViewModel) {
        if let appCoordinator = appCoordinator {
            appCoordinator.navigate(to: .productRoute(.productDetail(productID: productID, detailVM: detailVM)))
        } else {
            print("appCoordinator is nil")
        }
    }
    
}

enum ProductRoute: Hashable {
    
    case productDetail(productID: String, detailVM: ProductDetailViewModel)
    
    // Để enum này conform Hashable, cần bỏ closure/delegate khi so sánh
    static func == (lhs: ProductRoute, rhs: ProductRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.productDetail(p1, _), .productDetail(p2, _)):
            return p1 == p2
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .productDetail(id, _):
            hasher.combine(id)
        }
    }
}


