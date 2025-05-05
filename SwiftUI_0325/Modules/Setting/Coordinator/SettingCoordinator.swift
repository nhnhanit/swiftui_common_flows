//
//  SettingCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

import SwiftUI

final class SettingCoordinator: ObservableObject {
    
    func goToUserProfile(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?) {
        EnvironmentContainer.appCoordinator.push(to: .settingRoute(.userProfile(user: user, onSaveUser: onSaveUser)))
    }
    
    func popTopSplash() {
        EnvironmentContainer.appCoordinator.popToRoot()
    }
}
