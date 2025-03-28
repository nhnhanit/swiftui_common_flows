//
//  RootView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            SplashModule.build(coordinator: coordinator)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splash:
                        SplashModule.build(coordinator: coordinator)
                    case .login:
                        LoginModule.build(coordinator: coordinator)
                    case .home:
                        HomeModule.build(coordinator: HomeCoordinator(appCoordinator: coordinator))
                    }
                }
        }
    }
}
