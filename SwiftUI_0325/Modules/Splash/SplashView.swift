//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    init(appCoordinator: AppCoordinator, globalAlertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: SplashViewModel(appCoordinator: appCoordinator,
                                                               globalAlertManager: globalAlertManager))
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
    @Previewable let globalAlertManager = GlobalAlertManager()
    
    return SplashModule.build(appCoordinator: appCoordinator, globalAlertManager: globalAlertManager)
}

