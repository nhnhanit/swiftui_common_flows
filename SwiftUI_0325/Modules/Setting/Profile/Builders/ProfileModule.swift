//
//  ProfileModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

final class ProfileModule {
    
    @MainActor
    static func build(user: UserProfile, onSaveUser: ((UserProfile) -> Void)?) -> ProfileView {
        let viewModel = ProfileViewModel(user: user, onSaveUser: onSaveUser)
        
        return ProfileView(viewModel: viewModel)
    }
}

