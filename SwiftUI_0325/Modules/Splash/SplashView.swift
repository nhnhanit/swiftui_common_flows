//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    init(coordinator: AppCoordinator, alertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: SplashViewModel(coordinator: coordinator,
                                                    alertManager: alertManager))
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
    @Previewable let alertManager = GlobalAlertManager()
    
    return SplashModule.build(coordinator: appCoordinator, alertManager: alertManager)
}

