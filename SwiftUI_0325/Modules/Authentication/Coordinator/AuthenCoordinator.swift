//
//  AuthenCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class AuthenCoordinator: ObservableObject {
    private weak var appCoordinator: Navigatable?
    
    init(appCoordinator: Navigatable) {
        self.appCoordinator = appCoordinator
    }
    
    func goToOTPVerify(phone: String) {
        appCoordinator?.push(to: .authenRoute(.OTPVerity(phone: phone)))
    }
    
}



