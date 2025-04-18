//
//  ProfileView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(user: UserProfile, onSaveUser: ((UserProfile) -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(user: user, onSaveUser: onSaveUser))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter name", text: $viewModel.user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.saveChanges()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("User Profile")
        .padding()
    }
}
