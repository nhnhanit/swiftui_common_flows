//
//  SettingRouteViewBuilder.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//

import SwiftUI

struct SettingRouteViewBuilder {
    
    @MainActor
    @ViewBuilder
    static func view(for route: SettingRoute) -> some View {
        switch route {
        case .userProfile(let user, let onSaveUser):
            ProfileModule.build(user: user, onSaveUser: onSaveUser)
        }
    }
}
