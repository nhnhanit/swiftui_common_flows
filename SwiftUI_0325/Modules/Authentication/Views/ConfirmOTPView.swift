//
//  ConfirmOTPView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import SwiftUI

struct ConfirmOTPView: View {
    @ObservedObject var viewModel: ConfirmOTPViewModel
    
    var body: some View {
        VStack {
            Text("Press Confirm OTP Button to go to Main Screen")
            
            Button("Confirm OTP") {
                viewModel.confirmOTP()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Confirm OTP Screen")
    }
}
