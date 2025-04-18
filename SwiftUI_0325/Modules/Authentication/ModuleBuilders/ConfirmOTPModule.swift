//
//  ConfirmOTPModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

final class ConfirmOTPModule {
    static func build(coordinator: AuthenCoordinator) -> ConfirmOTPView {
        let viewModel = ConfirmOTPViewModel(coordinator: coordinator)
        
        return ConfirmOTPView(viewModel: viewModel)
    }
}
