//
//  EnvironmentContainer.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 5/5/25.
//


import Foundation

final class EnvironmentContainer {
    static let shared = EnvironmentContainer()

    // MARK: - Global Services
    var appCoordinator: Navigatable!
    var appAlertManager: AppAlertManager!

    private init() { }

    // MARK: - Safe Accessors (Optional: để tránh crash nếu dùng sớm)
    static var appCoordinator: Navigatable {
        if let appCoordinator = shared.appCoordinator {
                return appCoordinator
            } else {
                #if DEBUG
                return MockAppCoordinator()
                #else
                fatalError("❌ AppCoordinator not initialized.")
                #endif
            }
    }

    static var appAlertManager: AppAlertManager {
        if let alertManager = shared.appAlertManager {
                return alertManager
            } else {
                #if DEBUG
                return MockAlertManager()
                #else
                fatalError("❌ AppAlertManager not initialized.")
                #endif
            }
    }
}
