//
//  EmptyStateView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 16/4/25.
//


import SwiftUI

struct EmptyStateView: View {
    var title: String = "No data available"
    var message: String = "Please try again later."
    var imageName: String = "tray" // SF Symbol
    var retryAction: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .foregroundColor(.gray)

            Text(title)
                .font(.title3)
                .fontWeight(.semibold)

            Text(message)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            if let retryAction = retryAction {
                Button(action: retryAction) {
                    Text("Retry")
                        .font(.body)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}
