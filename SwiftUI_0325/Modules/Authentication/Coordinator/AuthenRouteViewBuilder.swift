//
//  AuthenRouteViewBuilder.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


import SwiftUI

struct AuthenRouteViewBuilder {
    static func view(for route: AuthenRoute,
                     appCoordinator: Navigatable,
                     appAlertManager: AppAlertManager) -> some View {
        switch route {
        case .OTPVerity(let phone):
            OTPVerifyModule.build(
                phone: phone,
                authenCoordinator: AuthenCoordinator(appCoordinator: appCoordinator),
                appAlertManager: appAlertManager
            )
        }
    }
}
