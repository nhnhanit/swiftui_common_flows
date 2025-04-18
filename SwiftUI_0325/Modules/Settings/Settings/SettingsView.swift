//
//  SettingsView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    init(coordinator: SettingsCoordinator, alertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: SettingsViewModel(coordinator: coordinator, alertManager: alertManager))
    }
    
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
            
            
            Button(role: .destructive) {
                viewModel.logoutButtonTapped()
            } label: {
                Text("Log Out")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                
            }
            .padding()
        }
        .padding()
        .onAppear {
            if (viewModel.user == nil) {
                viewModel.loadUser()
            } else {
                print("SettingsView onAppear dont refresh data")
            }
        }
        .navigationTitle("Settings-2")
    }
}

#Preview {    // Mock AlertManager
    let alertManager = GlobalAlertManager()

    // Mock Coordinator
    let mockCoordinator = SettingsCoordinator(
        appCoordinator: AppCoordinator()
    )
    
    SettingsView(coordinator: mockCoordinator, alertManager: alertManager)
        .environmentObject(mockCoordinator)
        .environmentObject(alertManager)
}
