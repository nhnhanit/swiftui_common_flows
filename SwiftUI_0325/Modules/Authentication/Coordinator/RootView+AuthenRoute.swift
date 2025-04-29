//
//  RootView+AuthenRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

enum AuthenRoute: Hashable {
    case OTPVerity(phone: String)
}

extension RootView {
    @ViewBuilder
    func authenRouteView(_ route: AuthenRoute) -> some View {
        switch route {
        case .OTPVerity(let phone):
            OTPVerifyModule.build(phone: phone, coordinator: AuthenCoordinator(appCoordinator: coordinator), alertManager: alertManager)
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)
        }
    }
}
