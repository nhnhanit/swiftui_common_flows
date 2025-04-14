//
//  AppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//
//

import SwiftUI

protocol Navigatable: AnyObject {
    func navigate(to route: AppRoute)
}

final class AppCoordinator: ObservableObject, Navigatable {
    @Published var path = NavigationPath()

    let alertManager: GlobalAlertManager

    init(alertManager: GlobalAlertManager) {
        self.alertManager = alertManager
    }
    
    // Navigate to any module
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

enum AppRoute: Hashable {
    case login
    case authenRoute(AuthenRoute)
    case main
    case productRoute(ProductRoute)
    case settingsRoute(SettingsRoute)
}

