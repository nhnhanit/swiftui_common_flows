//
//  RootView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var alertManager: GlobalAlertManager
        
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SplashModule.build(coordinator: coordinator, alertManager: alertManager)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .login:
                        LoginModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator), alertManager: alertManager)
                        
                    case .authenRoute(let authenRoute):
                        handleAuthenRoute(authenRoute)
                        
                    case .main:
                        MainModule.build(coordinator: coordinator, alertManager: alertManager)
                        
                    case .productRoute(let productRoute):
                        handleProductRoute(productRoute)
                        
                    case .settingsRoute(let settingsRoute):
                        handleSettingsRoute(settingsRoute)
                        
                    @unknown default:
                        EmptyView()
                    }
                }
        }
    }
    
}

#Preview {
    @Previewable let appCoordinator = AppCoordinator()
    @Previewable let alertManager = GlobalAlertManager()
    
    return RootView()
        .environmentObject(appCoordinator)
        .environmentObject(alertManager)
}
