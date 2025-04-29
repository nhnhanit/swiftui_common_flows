//
//  ProfileViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var user: UserProfile
    var onSaveUser: ((UserProfile) -> Void)?
        
    init(user: UserProfile, onSaveUser: ((UserProfile) -> Void)? = nil) {
        self.user = user
        self.onSaveUser = onSaveUser
    }
        
    func saveChanges() {
        onSaveUser?(user)
    }
}
