//
//  SettingsModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUICore

final class SettingsModule {
    static func build(coordinator: SettingsCoordinator, alertManager: GlobalAlertManager) -> SettingsView {
        
        return SettingsView(coordinator: coordinator, alertManager: alertManager)
    }
}
