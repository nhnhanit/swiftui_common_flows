//
//  SettingsModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUICore

final class SettingsModule {
    static func build(settingCoordinator: SettingCoordinator, globalAlertManager: GlobalAlertManager) -> SettingsView {
        
        return SettingsView(settingCoordinator: settingCoordinator, globalAlertManager: globalAlertManager)
    }
}
