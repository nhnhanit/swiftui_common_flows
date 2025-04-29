//
//  ProfileModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

final class ProfileModule {
    static func build(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?) -> ProfileView {        
        return ProfileView(user: user, onSaveUser: onSaveUser)
    }
}

