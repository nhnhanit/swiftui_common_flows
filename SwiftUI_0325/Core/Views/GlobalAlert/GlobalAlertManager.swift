//
//  GlobalAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//

import SwiftUI

class GlobalAlertManager: ObservableObject {
    @Published var currentAlert: GlobalAlert?

    func showAlert(title: String,
                   message: String? = nil,
                   primary: GlobalAlert.AlertAction,
                   secondary: GlobalAlert.AlertAction? = nil) {
        let alert = GlobalAlert(title: title,
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
