//
//  SplashModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class SplashModule {
    static func build(appCoordinator: AppCoordinator, globalAlertManager: GlobalAlertManager) -> SplashView {
        
        return SplashView(appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
    }
}
