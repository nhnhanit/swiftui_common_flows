//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    init(coordinator: AppCoordinator) {
        _viewModel = StateObject(wrappedValue: SplashViewModel(coordinator: coordinator))
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

