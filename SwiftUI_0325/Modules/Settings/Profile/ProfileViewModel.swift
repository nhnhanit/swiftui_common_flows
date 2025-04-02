//
//  ProfileViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    private let coordinator: SettingsCoordinator
    @Published var user: User
    var onSaveUser: ((User) -> Void)?
        
    init(user: User, coordinator: SettingsCoordinator, onSaveUser: ((User) -> Void)? = nil) {
        self.coordinator = coordinator
        self.user = user
        self.onSaveUser = onSaveUser
    }
        
    func saveChanges() {
        onSaveUser?(user)
    }
}
