//
//  SplashViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

class SplashViewModel: ObservableObject {

    init() {
    }
    
    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            if SessionManager.shared.isLoggedIn {
                EnvironmentContainer.appCoordinator.resetAndPush(to: .main)
            } else {
                EnvironmentContainer.appCoordinator.resetAndPush(to: .phoneLogin)
            }
        }
    }
}
