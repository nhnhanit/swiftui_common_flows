//
//  AuthenRouteViewBuilder.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


import SwiftUI

struct AuthenRouteViewBuilder {
    static func view(for route: AuthenRoute,
                     coordinator: Navigatable,
                     alertManager: GlobalAlertManager) -> some View {
        switch route {
        case .OTPVerity(let phone):
            OTPVerifyModule.build(
                phone: phone,
                coordinator: AuthenCoordinator(appCoordinator: coordinator),
                alertManager: alertManager
            )
        }
    }
}
