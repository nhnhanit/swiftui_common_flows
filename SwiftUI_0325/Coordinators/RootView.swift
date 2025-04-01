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
        NavigationStack(path: $coordinator.path) {
            // ✅ Chỉ có 1 NavigationStack
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
                    @unknown default:
                        EmptyView()
                    }
                }
        }
    }
    
    @ViewBuilder
    private func handleAuthenRoute(_ route: AuthenRoute) -> some View {
        switch route {
        case .signUp:
            SignUpModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator))
        case .confirmOTP:
            ConfirmOTPModule.build(coordinator: AuthenCoordinator(appCoordinator: coordinator))
        @unknown default:
            EmptyView() // ✅ Giúp tránh lỗi build khi thêm case mới trong tương lai
        }
    }
    
    @ViewBuilder
    private func handleProductRoute(_ route: ProductRoute) -> some View {
        switch route {
        case .productDetail(let productId):
            ProductDetailModule.build(productId: productId, coordinator: coordinator)
        @unknown default:
            EmptyView() // ✅ Giúp tránh lỗi build khi thêm case mới trong tương lai
        }
    }
}

#Preview {
    return RootView()
}
