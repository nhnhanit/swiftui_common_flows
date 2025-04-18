//
//  SettingsViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var user: User?
    
    let coordinator: SettingsCoordinator
    let alertManager: GlobalAlertManager

    init(coordinator: SettingsCoordinator, alertManager: GlobalAlertManager) {
        self.coordinator = coordinator
        self.alertManager = alertManager
        
        print("🔁 SettingsCoordinator INIT")
    }
    
    deinit {
        print("❌ DEINIT SettingsCoordinator")
    }

    func loadUser() {
        self.user = User(id: "1", name: "John Doe", email: "johndoe@example.com")
    }
    
    func logoutButtonTapped() {
        self.presentSignOutConfirmation {
            self.performSignOut()
        }
    }
    
    private func presentSignOutConfirmation(onConfirm: @escaping () -> Void) {
        alertManager.showAlert(
            title: "Sign Out?",
            message: "Are you sure you want to sign out?",
            primary: .init(title: "Ok", role: .destructive, action: {
                print("✅ Signed out")
                onConfirm()
            }),
            secondary: .init(title: "Cancel", role: .cancel, action: {
                print("❌ Cancelled delete")
            })
        )
    }
    
    private func performSignOut() {
        print("✅ User signed out.")
        // Gọi API / clear token / navigate to login...
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn") // Clear login state
        coordinator.popTopSplash()
    }
    
    func updateUserInfo() {
        if let user = self.user {
            coordinator.goToUserProfile(user: user) { user in
                print("New user name : \(user.name)")
                self.user = user
            }
        } else {
            print("user does not exist!")
        }
        
    }
    
}
