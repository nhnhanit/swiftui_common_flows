//
//  LoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class LoginModule {
    static func build(coordinator: AuthenCoordinator, alertManager: GlobalAlertManager) -> LoginView {
        return LoginView(coordinator: coordinator, alertManager: alertManager)
    }
}
