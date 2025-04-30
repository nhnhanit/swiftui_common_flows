//
//  OTPVerifyModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class OTPVerifyModule {
    static func build(phone: String, authenCoordinator: AuthenCoordinator, globalAlertManager: GlobalAlertManager) -> OTPVerifyView {
        return OTPVerifyView(phone: phone, authenCoordinator: authenCoordinator, globalAlertManager: globalAlertManager)
    }
}
