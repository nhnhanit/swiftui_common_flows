//
//  SettingsModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class SettingsModule {
    
    static func build() -> SettingsView {
        let settingCoordinator = DefaultSettingCoordinator()
        let viewModel = SettingsViewModel(settingCoordinator: settingCoordinator)
        
        return SettingsView(viewModel: viewModel)
    }
}
