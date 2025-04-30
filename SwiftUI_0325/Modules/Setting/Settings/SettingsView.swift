//
//  SettingsView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    init(settingCoordinator: SettingCoordinator, appAlertManager: AppAlertManager) {
        _viewModel = StateObject(wrappedValue: SettingsViewModel(settingCoordinator: settingCoordinator, appAlertManager: appAlertManager))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if let user = viewModel.user {
                Text("Name: \(user.name)")
                    .font(.title2)
            } else {
                ProgressView()
            }
            
            Button(action: viewModel.updateUserProfile) {
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
    let appAlertManager = AppAlertManager()

    // Mock Coordinator
    let mockSettingCoordinator = SettingCoordinator(
        appCoordinator: AppCoordinator()
    )
    
    SettingsView(settingCoordinator: mockSettingCoordinator, appAlertManager: appAlertManager)
        .environmentObject(mockSettingCoordinator)
        .environmentObject(appAlertManager)
}
