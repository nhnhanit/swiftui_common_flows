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
                    case .phoneLogin:
                        PhoneLoginModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator), alertManager: alertManager)
                    case .authenRoute(let authenRoute):
                        AuthenRouteViewBuilder.view(for: authenRoute, coordinator: coordinator, alertManager: alertManager)
                    case .main:
                        MainTabModule.build(coordinator: coordinator, alertManager: alertManager)
                    case .postRoute(let postRoute):
                        PostRouteViewBuilder.view(for: postRoute)
                    case .settingRoute(let settingRoute):
                        SettingRouteViewBuilder.view(for: settingRoute)
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
