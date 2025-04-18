//
//  SignUpViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    private let coordinator: AuthenCoordinator

    init(coordinator: AuthenCoordinator) {
        self.coordinator = coordinator
    }

    func signUp() {
//        coordinator.goToConfirmOTP()
    }
}
