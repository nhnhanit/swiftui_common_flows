//
//  LoginViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    private let coordinator: AuthenCoordinator

    init(coordinator: AuthenCoordinator) {
        self.coordinator = coordinator
    }

    func login() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        coordinator.login()
    }
    
    func goToSignUp() {
        coordinator.goToSignUp()
    }
}
