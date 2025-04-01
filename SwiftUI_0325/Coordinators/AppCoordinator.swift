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
    case main
//    case product(ProductRoute)  // 📌 Module A
//    case settings(SettingsRoute) // 📌 Module B
}

enum ProductRoute: Hashable {
    case productList
    case productDetail(productID: String)
    case cart
}

enum SettingsRoute: Hashable {
    case profile
    case logout
}


