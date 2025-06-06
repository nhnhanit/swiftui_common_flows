//
//  OTPVerifyView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

struct OTPVerifyView: View {
    @StateObject var viewModel: OTPVerifyViewModel

    init(viewModel: OTPVerifyViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("OTP sent to \(viewModel.phone)")

            TextField("Input OTP", text: $viewModel.otp)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.error {
                Text(error).foregroundColor(.red)
            }

            Button("Verify") {
                Task { await viewModel.verifyOTP() }
            }
        }
        .padding()
        .navigationTitle("Verify OTP")
    }
}
