//
//  AppAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//

import SwiftUI

class AppAlertManager: ObservableObject {
    @Published var currentAlert: AppAlert?

    func showAlert(title: String,
                   message: String? = nil,
                   primary: AppAlert.AlertAction,
                   secondary: AppAlert.AlertAction? = nil) {
        let alert = AppAlert(title: title,
                                message: message,
                                primaryAction: primary,
                                secondaryAction: secondary)
        withAnimation {
            currentAlert = alert
        }
    }

    func dismiss() {
        withAnimation {
            currentAlert = nil
        }
    }
}
