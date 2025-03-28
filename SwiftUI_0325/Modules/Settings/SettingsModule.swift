//
//  SettingsModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//


final class SettingsModule {
    static func build(coordinator: SettingsCoordinator) -> SettingsView {
        let viewModel = SettingsViewModel(coordinator: coordinator)
        return SettingsView(viewModel: viewModel)
    }
}
