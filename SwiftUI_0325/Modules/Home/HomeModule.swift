//
//  HomeModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class HomeModule {
    static func build(coordinator: HomeCoordinator) -> HomeView {
        let viewModel = HomeViewModel(coordinator: coordinator)
        return HomeView(viewModel: viewModel)
    }
}


