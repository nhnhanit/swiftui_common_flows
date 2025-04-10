//
//  GlobalAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//


// GlobalAlertManager.swift
import SwiftUI

final class GlobalAlertManager: ObservableObject {
    @Published var currentAlert: GlobalAlert?

    func showAlert(_ alert: GlobalAlert) {
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
