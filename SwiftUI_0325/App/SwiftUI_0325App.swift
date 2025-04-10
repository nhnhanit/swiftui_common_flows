//
//  SwiftUI_0325App.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

@main
struct SwiftUI_0325App: App {
    @StateObject private var alertManager = GlobalAlertManager()
    
    var body: some Scene {
        
        WindowGroup {
            ZStack {
                //ContentView()
                RootView(coordinator: AppCoordinator(alertManager: alertManager))
                GlobalAlertView() // 👈 Hiển thị alert toàn app
            }
            .environmentObject(alertManager)
        }
    }
}
