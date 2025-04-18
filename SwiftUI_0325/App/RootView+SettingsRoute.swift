//
//  RootView+SettingsRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

extension RootView {
    @ViewBuilder
    func handleSettingsRoute(_ route: SettingsRoute) -> some View {
        switch route {
        case .userProfile(let user, let onSaveUser):
            ProfileModule.build(user: user, onSaveUser: onSaveUser)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}
