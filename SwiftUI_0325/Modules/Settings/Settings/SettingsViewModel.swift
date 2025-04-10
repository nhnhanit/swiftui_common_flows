//
//  SettingsViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var user: User?
    
    private let coordinator: SettingsCoordinator
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
        
        print("🔁 SettingsCoordinator INIT")
    }
    
    deinit {
        print("❌ DEINIT SettingsCoordinator")
    }

    func loadUser() {
        self.user = User(id: UUID(), name: "John Doe", email: "johndoe@example.com")
    }
    
    func logoutButtonTapped() {
        coordinator.presentSignOutConfirmation {
            self.performSignOut()
        }
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
