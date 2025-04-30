//
//  PhoneLoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class PhoneLoginModule {
    static func build(authenCoordinator: AuthenCoordinator, globalAlertManager: GlobalAlertManager) -> PhoneLoginView {
        return PhoneLoginView(authenCoordinator: authenCoordinator, globalAlertManager: globalAlertManager)
    }
}
