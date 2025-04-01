//
//  LoginViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func login() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        coordinator.goToMain()
    }
}
