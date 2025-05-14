//
//  SettingsViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var user: UserProfile?
    let settingCoordinator: SettingCoordinator
    let alertManager: AppAlertManaging

    init(settingCoordinator: SettingCoordinator,
         alertManager: AppAlertManaging = EnvironmentContainer.appAlertManager) {
        self.settingCoordinator = settingCoordinator
        self.alertManager = alertManager
        
        print("🔁 SettingCoordinator INIT")
    }
    
    deinit {
        print("❌ DEINIT SettingCoordinator")
    }

    func loadUser() {
        self.user = UserProfile(id: "1", name: "John Doe", email: "johndoe@example.com")
    }
    
    func logoutButtonTapped() {
        alertManager.showAlert(
            title: "Sign Out?",
            message: "Are you sure you want to sign out?",
            primary: .init(title: "Ok", role: .destructive, action: { [weak self] in
                guard let self = self else { return }
                
                self.performSignOut()
            }),
            secondary: .init(title: "Cancel", role: .cancel, action: {
                print("❌ Cancelled delete")
            })
        )
    }
    
    private func performSignOut() {
        print("✅ User signed out.")
        
        // update isLoggedIn will emit to AppCoorditor and navigate
        SessionManager.shared.logOut()
    }
    
    func updateUserProfile() {
        if let user = self.user {
            settingCoordinator.goToUserProfile(user: user) { user in
                print("New user name : \(user.name)")
                self.user = user
            }
        } else {
            print("user does not exist!")
        }
        
    }
    
}
