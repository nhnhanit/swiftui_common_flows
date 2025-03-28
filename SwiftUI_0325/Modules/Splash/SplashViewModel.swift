//
//  SplashViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class SplashViewModel: ObservableObject {
    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
            self.coordinator.navigate(to: isLoggedIn ? .home : .login)
        }
    }
}
