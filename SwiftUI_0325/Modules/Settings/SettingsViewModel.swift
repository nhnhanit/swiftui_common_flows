//
//  SettingsViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let coordinator: SettingsCoordinator

    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }

    func logout() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn") // Clear login state
        coordinator.logout()
    }
}
