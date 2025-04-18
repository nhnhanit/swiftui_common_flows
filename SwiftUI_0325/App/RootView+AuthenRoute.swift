//
//  RootView+AuthenRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

extension RootView {
    @ViewBuilder
    func handleAuthenRoute(_ route: AuthenRoute) -> some View {
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
