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

    private let authenCoordinator: AuthenCoordinator
    private let phoneLoginRepository: PhoneLoginRepository
    let phone: String
    
    init(phone: String, authenCoordinator: AuthenCoordinator, phoneLoginRepository: PhoneLoginRepository) {
        self.phone = phone
        self.authenCoordinator = authenCoordinator
        self.phoneLoginRepository = phoneLoginRepository
    }
    
    func verifyOTP() async {
        do {
            let token = try await phoneLoginRepository.verifyOTP(for: phone, otp: otp)
            SessionManager.shared.logIn(with: token)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
