//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    init(appCoordinator: AppCoordinator, appAlertManager: AppAlertManager) {
        _viewModel = StateObject(wrappedValue: SplashViewModel(appCoordinator: appCoordinator,
                                                               appAlertManager: appAlertManager))
    }

    var body: some View {
        VStack {
            Text("Splash Screen")
        }
        .onAppear {
            viewModel.checkLoginStatus()
        }
    }
}

#Preview {
    @Previewable let appCoordinator = AppCoordinator()
    @Previewable let appAlertManager = AppAlertManager()
    
    return SplashModule.build(appCoordinator: appCoordinator, appAlertManager: appAlertManager)
}

