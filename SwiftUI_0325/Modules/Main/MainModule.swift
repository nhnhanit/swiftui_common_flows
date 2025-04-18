//
//  MainModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class MainModule {
    static func build(coordinator: AppCoordinator, alertManager: GlobalAlertManager) -> MainView {
        
        return MainView(coordinator: coordinator, alertManager: alertManager)
    }
}


