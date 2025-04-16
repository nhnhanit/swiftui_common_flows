//
//  LoadingView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 16/4/25.
//

import SwiftUI

struct LoadingView: View {
    var message: String = ""
    var tintColor: Color = .white
    var backgroundOpacity: Double = 0.2

    var body: some View {
        ZStack {
            Color.black.opacity(backgroundOpacity)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
                    .scaleEffect(1.5)

                if !message.isEmpty {
                    Text(message)
                        .foregroundColor(tintColor)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 8)
                }
            }
            .padding(24)
            .background(Color.black.opacity(0.6))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
        .transition(.opacity)
        .animation(.easeInOut, value: message) // animate based on message change
    }
}
