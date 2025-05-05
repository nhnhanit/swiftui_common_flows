//
//  OTPVerifyModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class OTPVerifyModule {
    static func build(phone: String, authenCoordinator: AuthenCoordinator) -> OTPVerifyView {
        return OTPVerifyView(phone: phone, authenCoordinator: authenCoordinator)
    }
}
