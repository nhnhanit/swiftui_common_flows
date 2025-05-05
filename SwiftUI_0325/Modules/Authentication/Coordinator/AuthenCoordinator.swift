//
//  AuthenCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class AuthenCoordinator: ObservableObject {
    
    func goToOTPVerify(phone: String) {
        EnvironmentContainer.appCoordinator.push(to: .authenRoute(.OTPVerity(phone: phone)))
    }
    
}



