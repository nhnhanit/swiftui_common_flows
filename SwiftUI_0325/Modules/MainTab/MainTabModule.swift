//
//  MainTabModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class MainTabModule {
    static func build(appCoordinator: AppCoordinator, globalAlertManager: GlobalAlertManager) -> MainTabView {
        
        return MainTabView(appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
    }
}


