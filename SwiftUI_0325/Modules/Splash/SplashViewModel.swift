//
//  SplashViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

class SplashViewModel: ObservableObject {
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

            if isLoggedIn {
                self.coordinator.navigate(to: .main)
            } else {
                self.coordinator.navigate(to: .login)
            }
        }
    }
}
