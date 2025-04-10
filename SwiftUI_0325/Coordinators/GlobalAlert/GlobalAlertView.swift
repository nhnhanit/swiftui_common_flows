//
//  GlobalAlertView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 9/4/25.
//

import SwiftUI

struct GlobalAlertView: View {
    @EnvironmentObject var alertManager: GlobalAlertManager

    var body: some View {
        if let alert = alertManager.currentAlert {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        alertManager.dismiss()
                    }

                VStack(spacing: 16) {
                    Text(alert.title)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)

                    if let message = alert.message {
                        Text(message)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    HStack {
                        if let secondaryText = alert.secondaryText, let onSecondary = alert.onSecondary {
                            Button(secondaryText) {
                                alertManager.dismiss()
                                onSecondary()
                            }
                            .padding()
                        }

                        Button(alert.primaryText) {
                            alertManager.dismiss()
                            alert.onPrimary()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding(40)
            }
            .transition(.opacity)
        }
    }
}
