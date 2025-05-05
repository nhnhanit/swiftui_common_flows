//
//  SwiftUI_0325App.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

@main
struct SwiftUI_0325App: App {
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var appAlertManager = AppAlertManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                RootView()
                AppAlertView()
            }
            .onAppear {
                EnvironmentContainer.shared.appCoordinator = appCoordinator
                EnvironmentContainer.shared.appAlertManager = appAlertManager
            }
            .environmentObject(appCoordinator)
            .environmentObject(appAlertManager)
        }
    }
}
