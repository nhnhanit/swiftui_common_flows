//
//  LoginView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Press Login Button to go to Main Screen")
            
            Button("Login") {
                viewModel.login()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Sign Up") {
                viewModel.goToSignUp()
            }
            .padding()
        }
        .navigationTitle("Login Screen")
    }
}
