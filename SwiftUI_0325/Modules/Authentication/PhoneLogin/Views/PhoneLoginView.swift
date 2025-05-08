//
//  PhoneLoginView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

struct PhoneLoginView: View {
    @StateObject var viewModel: PhoneLoginViewModel

    init(viewModel: PhoneLoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            TextField("Phone number", text: $viewModel.phone)
                .keyboardType(.phonePad)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.error {
                Text(error).foregroundColor(.red)
            }
            
            Button(action: {
                Task { await viewModel.requestOTP() }
            }) {
                Text("Send OTP")
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
