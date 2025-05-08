//
//  MockAlertManager.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 24/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

final class MockAlertManager: AppAlertManager {
    var didShowAlert = false
    var shownTitle: String?
    var shownMessage: String?
    var shownPrimaryTitle: String?
    var shownSecondaryTitle: String?

    override func showAlert(title: String,
                            message: String? = nil,
                            primary: AppAlert.AlertAction,
                            secondary: AppAlert.AlertAction? = nil) {
        super.showAlert(title: title, message: message, primary: primary, secondary: secondary)

        // Save value to test
        didShowAlert = true
        shownTitle = title
        shownMessage = message
        shownPrimaryTitle = primary.title
        shownSecondaryTitle = secondary?.title
    }
}
