//
//  AppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    // Điều hướng đến bất kỳ module nào
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func goToLogin() {
        path.append(AppRoute.login)
    }
    
    func goToMain() {
        path.append(AppRoute.main)
    }
    
    func popToSplash() {
        path.removeLast(path.count)
    }
    
}

enum AppRoute: Hashable {
    case login
    case authenRoute(AuthenRoute)
    case main
    case productRoute(ProductRoute)
}

enum ProductRoute: Hashable {
    
    case productDetail(product: Product, viewModel: ProductListViewModel)
    
    // Để enum này conform Hashable, cần bỏ closure khi so sánh
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

enum AuthenRoute: Hashable {
    case signUp
    case confirmOTP
}

enum SettingsRoute: Hashable {
    case profile
    case logout
}


