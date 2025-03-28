//
//  SettingsCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

final class SettingsCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    private let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func logout() {
        appCoordinator.popToRoot()
    }
}
