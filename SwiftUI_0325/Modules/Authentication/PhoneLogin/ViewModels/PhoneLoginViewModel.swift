//
//  PhoneLoginViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

@MainActor
final class PhoneLoginViewModel: ObservableObject {
    @Published var phone: String = ""
    @Published var error: String?

    private let authenCoordinator: AuthenCoordinator
    private let phoneLoginRepository: PhoneLoginRepository

    init(authenCoordinator: AuthenCoordinator, phoneLoginRepository: PhoneLoginRepository) {
        self.authenCoordinator = authenCoordinator
        self.phoneLoginRepository = phoneLoginRepository

#warning("fake_phone")
        phone = "1-770-736-8031 x56442"
    }

    func requestOTP() async {
        do {
            try await phoneLoginRepository.requestOTP(for: phone)
            authenCoordinator.goToOTPVerify(phone: phone)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
