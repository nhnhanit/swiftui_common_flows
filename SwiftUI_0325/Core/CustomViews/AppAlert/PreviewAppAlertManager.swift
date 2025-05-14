//
//  PreviewAppAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 5/5/25.
//

import SwiftUI

final class PreviewAppAlertManager: AppAlertManager {
    var didShowAlert = false
    var shownTitle: String?
    var shownMessage: String?
    var shownPrimaryTitle: String?
    var shownSecondaryTitle: String?
    var shownPolicy: AppAlertPolicy?

    override func showAlert(title: String,
                            message: String? = nil,
                            primary: AppAlert.AlertAction,
                            secondary: AppAlert.AlertAction? = nil,
                            policy: AppAlertPolicy? = .replaceExisting) {
        super.showAlert(title: title, message: message, primary: primary, secondary: secondary)

        didShowAlert = true
        shownTitle = title
        shownMessage = message
        shownPrimaryTitle = primary.title
        shownSecondaryTitle = secondary?.title
        shownPolicy = policy
    }
}
