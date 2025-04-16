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
                        if alert.secondaryAction?.role == .cancel {
                            alertManager.dismiss()
                            alert.secondaryAction?.action()
                        }
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

                    HStack(spacing: 12) {
                        if let secondary = alert.secondaryAction {
                            Button(secondary.title) {
                                alertManager.dismiss()
                                secondary.action()
                            }
                            .padding()
                            .background(color(for: secondary.role))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }

                        Button(alert.primaryAction.title) {
                            alertManager.dismiss()
                            alert.primaryAction.action()
                        }
                        .padding()
                        .background(color(for: alert.primaryAction.role))
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

    private func color(for role: GlobalAlert.AlertRole?) -> Color {
        switch role {
        case .cancel:
            return .gray
        case .destructive:
            return .red
        default:
            return .blue
        }
    }
}
