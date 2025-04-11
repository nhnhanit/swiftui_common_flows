//
//  AuthenCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

final class AuthenCoordinator: ObservableObject {
    private weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func goToMain() {
        appCoordinator?.navigate(to: .main)
    }
    
    func goToSignUp() {
        appCoordinator?.navigate(to: .authenRoute(.signUp))
    }
    
    func goToConfirmOTP() {
        appCoordinator?.navigate(to: .authenRoute(.confirmOTP))
    }
    
}

enum AuthenRoute: Hashable {
    case signUp
    case confirmOTP
}

