//
//  PhoneLoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class PhoneLoginModule {
    
    @MainActor
    static func build(authenCoordinator: AuthenCoordinator) -> PhoneLoginView {
        let viewModel = PhoneLoginViewModel(authenCoordinator: authenCoordinator)
        
        return PhoneLoginView(viewModel: viewModel)
    }
}
