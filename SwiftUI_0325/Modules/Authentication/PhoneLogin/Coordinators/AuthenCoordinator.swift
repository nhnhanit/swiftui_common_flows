//
//  AuthenCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

protocol AuthenCoordinator {
    func goToOTPVerify(phone: String)
}

final class DefaultAuthenCoordinator: AuthenCoordinator {
    
    func goToOTPVerify(phone: String) {
        EnvironmentContainer.appCoordinator.push(to: .authenRoute(.OTPVerity(phone: phone)))
    }
    
}
