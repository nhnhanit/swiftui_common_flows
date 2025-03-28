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
        NavigationStack(path: $coordinator.path) { // ✅ Chỉ có 1 NavigationStack
            SplashModule.build(coordinator: coordinator)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splash:
                        SplashModule.build(coordinator: coordinator)
                    case .login:
                        LoginModule.build(coordinator: coordinator)
                    case .home:
                        HomeModule.build(coordinator: coordinator)
                    case .product(.productDetail(let productId)):
                        ProductDetailModule.build(productId: productId, coordinator: coordinator)
                    case .settings:
                        EmptyView()
                    case .product(.productList):
                        EmptyView()
                    case .product(.cart):
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    return RootView()
}
