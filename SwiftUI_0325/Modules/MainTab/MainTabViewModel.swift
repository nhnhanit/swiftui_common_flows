//
//  MainViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class MainViewModel: ObservableObject {
    let appCoordinator: AppCoordinator
    let appAlertManager: AppAlertManager

    init(appCoordinator: AppCoordinator, appAlertManager: AppAlertManager) {
        self.appCoordinator = appCoordinator
        self.appAlertManager = appAlertManager
    }
}
