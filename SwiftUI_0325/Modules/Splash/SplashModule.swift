//
//  SplashModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class SplashModule {
    static func build(coordinator: AppCoordinator) -> SplashView {
        let viewModel = SplashViewModel(coordinator: coordinator)
        
        return SplashView(coordinator: coordinator)
    }
}
