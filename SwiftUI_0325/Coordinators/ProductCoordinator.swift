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

    func goToProductDetail(productID: String) {
        appCoordinator?.navigate(to: .productModule(.productDetail(productID: productID)))
    }
}


