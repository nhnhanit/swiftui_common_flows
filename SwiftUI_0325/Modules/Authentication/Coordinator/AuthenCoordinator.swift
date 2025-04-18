//
//  AuthenCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class AuthenCoordinator: ObservableObject {
    weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

//    func goToSignUp() {
//        appCoordinator?.push(to: .authenRoute(.signUp))
//    }
//    
//    func goToConfirmOTP() {
//        appCoordinator?.push(to: .authenRoute(.confirmOTP))
//    }
    
    func goToOTPVerify(phone: String) {
        appCoordinator?.push(to: .authenRoute(.OTPVerity(phone: phone)))
    }
    
}

enum AuthenRoute: Hashable {
//    case signUp
//    case confirmOTP
    case OTPVerity(phone: String)
}

