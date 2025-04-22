//
//  MainViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class MainViewModel: ObservableObject {
    let coordinator: AppCoordinator
    let alertManager: GlobalAlertManager

    init(coordinator: AppCoordinator, alertManager: GlobalAlertManager) {
        self.coordinator = coordinator
        self.alertManager = alertManager
    }
}
