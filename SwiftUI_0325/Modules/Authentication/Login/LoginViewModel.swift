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
        // old way:
        //UserDefaults.standard.set(true, forKey: "isLoggedIn")
        //coordinator.goToMain()

        // new way:
        // update isLoggedIn will emit to AppCoorditor and navigate
        SessionManager.shared.logIn(with: "accessToken")
    }
    
    func goToSignUp() {
        coordinator.goToSignUp()
    }
}
