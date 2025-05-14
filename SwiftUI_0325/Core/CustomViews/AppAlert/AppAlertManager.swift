//
//  AppAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//

import SwiftUI

enum AppAlertPolicy {
    case replaceExisting
    case ignoreIfAlreadyPresented
    // case queue → future support
}

protocol AppAlertManaging {
    func showAlert(
        title: String,
        message: String?,
        primary: AppAlert.AlertAction,
        secondary: AppAlert.AlertAction?,
        policy: AppAlertPolicy?
    )
    
    func dismiss()
}

extension AppAlertManaging {
    func showAlert(
        title: String,
        message: String? = nil,
        primary: AppAlert.AlertAction,
        secondary: AppAlert.AlertAction? = nil,
        policy: AppAlertPolicy? = .replaceExisting
    ) {
        showAlert(title: title, message: message, primary: primary, secondary: secondary, policy: policy)
    }
}

class AppAlertManager: ObservableObject, AppAlertManaging {
    @Published private(set) var currentAlert: AppAlert?
    
    func showAlert(
        title: String,
        message: String?,
        primary: AppAlert.AlertAction,
        secondary: AppAlert.AlertAction?,
        policy: AppAlertPolicy? = .replaceExisting
    ) {
        let wrappedPrimary = wrapAction(primary)
        let wrappedSecondary = secondary.map(wrapAction)
        
        let alert = AppAlert(
            title: title,
            message: message,
            primaryAction: wrappedPrimary,
            secondaryAction: wrappedSecondary
        )
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch policy ?? .replaceExisting {
            case .replaceExisting:
                self.currentAlert = alert
                
            case .ignoreIfAlreadyPresented:
                if self.currentAlert == nil {
                    self.currentAlert = alert
                }
                
                // case .queue: // To be implemented
            }
        }
    }
    
    func dismiss() {
        DispatchQueue.main.async { [weak self] in
            self?.currentAlert = nil
        }
    }
    
    private func wrapAction(_ action: AppAlert.AlertAction) -> AppAlert.AlertAction {
        return AppAlert.AlertAction(
            title: action.title,
            role: action.role,
            action: { [weak self] in
                action.action()
                self?.dismiss()
            }
        )
    }
}
