//
//  OTPVerifyViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

@MainActor
final class OTPVerifyViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var error: String?

    private let coordinator: AuthenCoordinator
    private let alertManager: GlobalAlertManager
    private let service: PhoneLoginAuthServicing
    let phone: String
    
    init(phone: String, coordinator: AuthenCoordinator, alertManager: GlobalAlertManager, service: PhoneLoginAuthServicing = PhoneLoginAuthService()) {
        self.coordinator = coordinator
        self.alertManager = alertManager
        self.service = service
        self.phone = phone
    }
    
    func verifyOTP() async {
        do {
            let token = try await service.verifyOTP(for: phone, otp: otp)
            SessionManager.shared.logIn(with: token)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
