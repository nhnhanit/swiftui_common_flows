//
//  OTPVerifyModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class OTPVerifyModule {
    
    @MainActor
    static func build(phone: String) -> OTPVerifyView {
        let networkService = DefaultNetworkService()
        let authenCoordinator = DefaultAuthenCoordinator()
        let phoneLoginAuthService = DefaultPhoneLoginAuthService(networkService: networkService)
        
        let viewModel = OTPVerifyViewModel(phone: phone, authenCoordinator: authenCoordinator, service: phoneLoginAuthService)
        
        return OTPVerifyView(viewModel: viewModel)
    }
}
