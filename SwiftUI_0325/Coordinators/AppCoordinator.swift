//
//  AppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//
//

import SwiftUI

final class AppCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()

    func navigate(to route: AppRoute) {
        navigationPath.append(route)
    }

    func logout() {
        navigationPath = NavigationPath() // Xóa hết stack để quay về Splash
    }
}

enum AppRoute: Hashable {
    case splash, login, home
}
