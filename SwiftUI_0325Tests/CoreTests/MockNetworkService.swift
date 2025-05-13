//
//  MockNetworkService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

final class MockNetworkService: NetworkService {
    var shouldFail = false
    var jsonFileName: String?

    func request<T: Decodable>(_ endpoint: APIRequest) async throws -> T {
        if shouldFail {
            throw URLError(.badServerResponse)
        }

        guard let fileName = jsonFileName else {
            fatalError("MockNetworkService: Miss jsonFileName")
        }

        return try JSONTestLoader.load(fileName)
    }
}
