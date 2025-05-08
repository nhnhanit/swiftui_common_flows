//
//  PhoneLoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class PhoneLoginModule {
    
    @MainActor
    static func build() -> PhoneLoginView {
        let networkService = DefaultNetworkService()
        let phoneLoginAuthService = DefaultPhoneLoginAuthService(networkService: networkService)
        let authenCoordinator = DefaultAuthenCoordinator()
        
        let viewModel = PhoneLoginViewModel(authenCoordinator: authenCoordinator, service: phoneLoginAuthService)
        
        return PhoneLoginView(viewModel: viewModel)
    }
}
