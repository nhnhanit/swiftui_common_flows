//
//  SplashViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation
import SwiftUI

class SplashViewModel: ObservableObject {

    init() {
    }
    
    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            
            if SessionManager.shared.isLoggedIn {
                EnvironmentContainer.appCoordinator.resetAndPush(to: .main)
            } else {
//                self.alertManager.showAlert(
//                    title: "Not logged in",
//                    message: "Please log in to continue.",
//                    primary: .init(title: "OK", role: .cancel, action: { [weak self] in
//                        guard let self = self else { return }
//                        self.coordinator.resetAndPush(to: .phoneLogin)
//                    }),
//                    secondary: nil
//                )
                EnvironmentContainer.appCoordinator.resetAndPush(to: .phoneLogin)
            }
        }
    }
}
