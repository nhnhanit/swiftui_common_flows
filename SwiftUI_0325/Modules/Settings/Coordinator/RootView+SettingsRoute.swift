//
//  RootView+SettingsRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

enum SettingsRoute: Hashable {
    case userProfile(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?)
    
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

extension RootView {
    @ViewBuilder
    func settingsRouteView(_ route: SettingsRoute) -> some View {
        switch route {
        case .userProfile(let user, let onSaveUser):
            ProfileModule.build(user: user, onSaveUser: onSaveUser)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}
