//
//  ProfileModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

final class ProfileModule {
    static func build(user: User, coordinator: SettingsCoordinator, onSaveUser: ((User) -> Void)?) -> ProfileView {
        let viewModel = ProfileViewModel(user: user, coordinator: coordinator, onSaveUser: onSaveUser)
        
        return ProfileView(viewModel: viewModel)
    }
}

