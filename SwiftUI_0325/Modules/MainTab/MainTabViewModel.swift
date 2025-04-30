//
//  MainViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

final class MainViewModel: ObservableObject {
    let appCoordinator: AppCoordinator
    let globalAlertManager: GlobalAlertManager

    init(appCoordinator: AppCoordinator, globalAlertManager: GlobalAlertManager) {
        self.appCoordinator = appCoordinator
        self.globalAlertManager = globalAlertManager
    }
}
