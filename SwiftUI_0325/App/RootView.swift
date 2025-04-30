//
//  RootView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var globalAlertManager: GlobalAlertManager
        
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            SplashModule.build(appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .phoneLogin:
                        PhoneLoginModule.build(authenCoordinator: AuthenCoordinator(appCoordinator: appCoordinator), globalAlertManager: globalAlertManager)
                    case .authenRoute(let authenRoute):
                        AuthenRouteViewBuilder.view(for: authenRoute, appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
                    case .main:
                        MainTabModule.build(appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
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
    @Previewable let globalAlertManager = GlobalAlertManager()
    
    return RootView()
        .environmentObject(appCoordinator)
        .environmentObject(globalAlertManager)
}
