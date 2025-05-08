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
        let phoneLoginRepository = DefaultPhoneLoginRepository(networkService: networkService)
        let authenCoordinator = DefaultAuthenCoordinator()
        
        let viewModel = PhoneLoginViewModel(authenCoordinator: authenCoordinator, phoneLoginRepository: phoneLoginRepository)
        
        return PhoneLoginView(viewModel: viewModel)
    }
}
