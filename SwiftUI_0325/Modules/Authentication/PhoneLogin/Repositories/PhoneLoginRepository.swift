//
//  PhoneLoginRepository.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

protocol PhoneLoginRepository {
    func requestOTP(for phone: String) async throws
    func verifyOTP(for phone: String, otp: String) async throws -> String
}

final class DefaultPhoneLoginRepository: PhoneLoginRepository {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func requestOTP(for phone: String) async throws {
        let _: FakeResponse = try await networkService.request(PhoneLoginAPI.requestOTP(phone: phone))
    }

    func verifyOTP(for phone: String, otp: String) async throws -> String {
        let _: FakeResponse = try await networkService.request(PhoneLoginAPI.verifyOTP(phone: phone, otp: otp))
        
#warning("fake_token")
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
