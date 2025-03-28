//
//  HomeCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

final class HomeCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    
    let productCoordinator = ProductCoordinator()
    let settingsCoordinator: SettingsCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.settingsCoordinator = SettingsCoordinator(appCoordinator: appCoordinator)
    }
}

enum HomeRoute: Hashable {
    case productList
    case settings
}


