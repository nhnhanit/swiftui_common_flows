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

    func goToProductDetail(product: Product) {
//        appCoordinator?.navigate(to: .productRoute(.productDetail(product: product)))
        if let appCoordinator = appCoordinator {
            appCoordinator.navigate(to: .productRoute(.productDetail(product: product)))
        } else {
            print("appCoordinator is nil")
        }
    }
}


