//
//  LoginView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    init(coordinator: AuthenCoordinator, alertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(coordinator: coordinator,
                                                    alertManager: alertManager))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Đăng nhập")
                .font(.largeTitle)
                .bold()
            
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            
            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                Task {
                    await viewModel.login()
                }
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            Button(action: {
                viewModel.goToSignUpTapped()
            }) {
                Text("You have not account? Sign up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}
