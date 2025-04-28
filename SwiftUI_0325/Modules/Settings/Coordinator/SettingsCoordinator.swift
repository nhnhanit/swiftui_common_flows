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
    
    func goToUserProfile(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?) {
        if let appCoordinator = appCoordinator {
            appCoordinator.push(to: .settingsRoute(.userProfile(user: user, onSaveUser: onSaveUser)))
        } else {
            print("appCoordinator is nil")
        }
    }
    
    func popTopSplash() {
        appCoordinator?.popToRoot()
    }
    
}
