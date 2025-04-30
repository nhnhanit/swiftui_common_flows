//
//  RootView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var appAlertManager: AppAlertManager
        
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            SplashModule.build(appCoordinator: appCoordinator, appAlertManager: appAlertManager)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .phoneLogin:
                        PhoneLoginModule.build(authenCoordinator: AuthenCoordinator(appCoordinator: appCoordinator), appAlertManager: appAlertManager)
                    case .authenRoute(let authenRoute):
                        AuthenRouteViewBuilder.view(for: authenRoute, appCoordinator: appCoordinator, appAlertManager: appAlertManager)
                    case .main:
                        MainTabModule.build(appCoordinator: appCoordinator, appAlertManager: appAlertManager)
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
    @Previewable let appAlertManager = AppAlertManager()
    
    return RootView()
        .environmentObject(appCoordinator)
        .environmentObject(appAlertManager)
}
