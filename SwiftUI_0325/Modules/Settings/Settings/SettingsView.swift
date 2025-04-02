//
//  SettingsView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
        
    var body: some View {
        VStack(spacing: 20) {
            if let user = viewModel.user {
                Text("Name: \(user.name)")
                    .font(.title2)
            } else {
                ProgressView()
            }
            
            Button(action: viewModel.updateUserInfo) {
                Text("Update User Info")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: viewModel.logout) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .onAppear {
            viewModel.loadUser()
        }
        
    }
    
}
