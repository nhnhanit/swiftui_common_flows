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
    private let service: PhoneLoginAuthService

    init(authenCoordinator: AuthenCoordinator, service: PhoneLoginAuthService) {
        self.authenCoordinator = authenCoordinator
        self.service = service

#warning("hardcode phone")
        phone = "1-770-736-8031 x56442"
    }

    func requestOTP() async {
        do {
            try await service.requestOTP(for: phone)
            authenCoordinator.goToOTPVerify(phone: phone)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
