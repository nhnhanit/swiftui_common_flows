//
//  PhoneAuthService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

protocol PhoneLoginAuthService {
    func requestOTP(for phone: String) async throws
    func verifyOTP(for phone: String, otp: String) async throws -> String
}

final class DefaultPhoneLoginAuthService: PhoneLoginAuthService {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func requestOTP(for phone: String) async throws {
        let _: FakeResponse = try await networkService.request(PhoneLoginAuthAPI.requestOTP(phone: phone))
    }

    func verifyOTP(for phone: String, otp: String) async throws -> String {
        let _: FakeResponse = try await networkService.request(PhoneLoginAuthAPI.verifyOTP(phone: phone, otp: otp))

        // 🔐 Tạo token giả
        return UUID().uuidString
    }
    
    enum PhoneLoginError: Error, LocalizedError {
        case invalidCredentials

        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Phone number or OTP is incorrect."
            }
        }
    }
}

struct EmptyResponse: Decodable {}

struct FakeResponse: Decodable {
    let body: String
    let userId: String
    let title: String
    let id: Int
}
