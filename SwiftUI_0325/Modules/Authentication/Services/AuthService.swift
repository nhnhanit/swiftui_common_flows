//
//  Service.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

protocol AuthServicing {
    func login(username: String, password: String) async throws -> String
}

final class AuthService: AuthServicing {
    private let network: NetworkService

    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }

    func login(username: String, password: String) async throws -> String {
        let users: [User] = try await network.request(LoginAPI.login(username: username, password: password))

        guard let _ = users.first else {
            throw LoginError.invalidCredentials
        }

        // 🔐 Tạo token giả
        return UUID().uuidString
    }

    enum LoginError: Error, LocalizedError {
        case invalidCredentials

        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Username is incorrect."
            }
        }
    }
}
