//
//  RootView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator: AppCoordinator
        
    var body: some View {
        NavigationStack(path: $coordinator.path) { // ✅ Only 1 NavigationStack
            SplashModule.build(coordinator: coordinator)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .login:
                        LoginModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator))
                        
                    case .authenRoute(let authenRoute):
                        handleAuthenRoute(authenRoute)
                        
                    case .main:
                        MainModule.build(coordinator: coordinator)
                        
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

// MARK: - Handle Settings Route

extension RootView {
    
    @ViewBuilder
    private func handleSettingsRoute(_ route: SettingsRoute) -> some View {
        switch route {
        case .userProfile(let user, let onSaveUser):
            ProfileModule.build(user: user, coordinator: SettingsCoordinator(appCoordinator: coordinator), onSaveUser: onSaveUser)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}

// MARK: - Handle Product Route

extension RootView {
    
    @ViewBuilder
    private func handleProductRoute(_ route: ProductRoute) -> some View {
        switch route {
        case .productDetail(_, let detailVM):
            ProductDetailView(viewModel: detailVM)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}

// MARK: - Handle Authen Route

extension RootView {
    
    @ViewBuilder
    private func handleAuthenRoute(_ route: AuthenRoute) -> some View {
        switch route {
        case .signUp:
            SignUpModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator))
            
        case .confirmOTP:
            ConfirmOTPModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator))
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}

#Preview {
    @Previewable @StateObject var alertManager = GlobalAlertManager()
    return RootView(coordinator: AppCoordinator(alertManager: alertManager))
        .environmentObject(alertManager)
}
