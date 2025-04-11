//
//  SettingsCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

import SwiftUI

final class SettingsCoordinator: ObservableObject {
    private weak var appCoordinator: AppCoordinator?
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func goToUserProfile(user: User, onSaveUser: ((User) -> Void)?) {
        if let appCoordinator = appCoordinator {
            appCoordinator.navigate(to: .settingsRoute(.userProfile(user: user, onSaveUser: onSaveUser)))
        } else {
            print("appCoordinator is nil")
        }
    }
    
    func presentSignOutConfirmation(onConfirm: @escaping () -> Void) {
        appCoordinator?.alertManager.showAlert(GlobalAlert(
            title: "Sign Out?",
            message: "Are you sure you want to sign out?",
            primaryText: "Confirm",
            secondaryText: "Cancel",
            onPrimary: {
                print("✅ Signed out")
                onConfirm()
            },
            onSecondary: {
                print("❌ Cancelled")
            }
        ))
    }
    
    func popTopSplash() {
        appCoordinator?.popToRoot()
    }
    
}

// MARK: - SettingsRoute

enum SettingsRoute: Hashable {
    case userProfile(user: User, onSaveUser: ((User) -> Void)?)
    
    // Để enum này conform Hashable, cần bỏ closure/delegate khi so sánh
    static func == (lhs: SettingsRoute, rhs: SettingsRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.userProfile(p1, _), .userProfile(p2, _)):
            return p1.id == p2.id
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .userProfile(user, _):
            hasher.combine(user.id)
        }
    }
}

