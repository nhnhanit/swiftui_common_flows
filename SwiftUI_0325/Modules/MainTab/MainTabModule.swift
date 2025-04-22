//
//  MainTabModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class MainTabModule {
    static func build(coordinator: AppCoordinator, alertManager: GlobalAlertManager) -> MainTabView {
        
        return MainTabView(coordinator: coordinator, alertManager: alertManager)
    }
}


