//
//  LoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class LoginModule {
    static func build(coordinator: AuthenCoordinator) -> LoginView {
        let viewModel = LoginViewModel(coordinator: coordinator)
        
        return LoginView(viewModel: viewModel)
    }
}
