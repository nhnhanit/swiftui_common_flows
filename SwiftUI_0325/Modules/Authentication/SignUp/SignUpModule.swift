//
//  SignUpModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

final class SignUpModule {
    static func build(coordinator: AuthenCoordinator) -> SignUpView {
        let viewModel = SignUpViewModel(coordinator: coordinator)
        
        return SignUpView(viewModel: viewModel)
    }
}
