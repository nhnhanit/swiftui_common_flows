//
//  LoginViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: String?
    
    private let coordinator: AuthenCoordinator
    private let alertManager: GlobalAlertManager
    private let authService: AuthServicing

    init(coordinator: AuthenCoordinator, alertManager: GlobalAlertManager, authService: AuthServicing = AuthService()) {
        self.coordinator = coordinator
        self.alertManager = alertManager
        self.authService = authService
    }
    
    func login() async {
        do {
#warning("Hardcoded username")
            username = "Bret"
            
            let token = try await authService.login(username: username, password: password)
            
            SessionManager.shared.logIn(with: token)
        } catch {
            self.error = error.localizedDescription
        }
    }
    
//    func login() {
//        // old way:
//        //UserDefaults.standard.set(true, forKey: "isLoggedIn")
//        //coordinator.goToMain()
//
//        // new way:
//        // update isLoggedIn will emit to AppCoorditor and navigate
//        SessionManager.shared.logIn(with: "accessToken")
//    }
    
    func goToSignUpTapped() {
        coordinator.goToSignUp()
    }
}
