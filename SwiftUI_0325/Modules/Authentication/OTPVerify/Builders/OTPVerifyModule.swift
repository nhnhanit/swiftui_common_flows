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
        let phoneLoginRepository = DefaultPhoneLoginRepository(networkService: networkService)
        
        let viewModel = OTPVerifyViewModel(phone: phone, authenCoordinator: authenCoordinator, phoneLoginRepository: phoneLoginRepository)
        
        return OTPVerifyView(viewModel: viewModel)
    }
}
