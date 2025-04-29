//
//  SettingRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


enum SettingRoute: Hashable {
    case userProfile(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?)
    
    // Để enum này conform Hashable, cần bỏ closure/delegate khi so sánh
    static func == (lhs: SettingRoute, rhs: SettingRoute) -> Bool {
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
