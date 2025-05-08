//
//  OTPVerifyModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class OTPVerifyModule {
    
    @MainActor
    static func build(phone: String) -> OTPVerifyView {
        let authenCoordinator = DefaultAuthenCoordinator()
        let viewModel = OTPVerifyViewModel(phone: phone, authenCoordinator: authenCoordinator)
        
        return OTPVerifyView(viewModel: viewModel)
    }
}
