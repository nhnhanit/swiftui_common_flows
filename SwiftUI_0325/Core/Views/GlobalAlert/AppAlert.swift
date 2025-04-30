//
//  AppAlert.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//

import SwiftUI

struct AppAlert: Identifiable {
    var id = UUID()
    
    let title: String
    let message: String?
    
    let primaryAction: AlertAction
    let secondaryAction: AlertAction?

    struct AlertAction {
        let title: String
        let role: AlertRole?
        let action: () -> Void

        init(title: String, role: AlertRole? = nil, action: @escaping () -> Void = {}) {
            self.title = title
            self.role = role
            self.action = action
        }
    }

    enum AlertRole {
        case cancel
        case destructive
        case normal
    }
}

