//
//  ConfirmOTPViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 1/4/25.
//

import Foundation

final class ConfirmOTPViewModel: ObservableObject {
    private let coordinator: AuthenCoordinator

    init(coordinator: AuthenCoordinator) {
        self.coordinator = coordinator
    }

    func confirmOTP() {
        // old way:
        //UserDefaults.standard.set(true, forKey: "isLoggedIn")
        //coordinator.goToMain()

        // new way:
        // update isLoggedIn will emit to AppCoorditor and navigate
        SessionManager.shared.logIn(with: "accessToken")
    }
}
