//
//  DefaultNetworkService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

final class DefaultNetworkService: NetworkService {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: APIRequest) async throws -> T {
        var components = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)!
        components.queryItems = endpoint.queryItems

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body

        // 🔍 Print request
        NetworkLogger.log(request: request)

        let (data, response) = try await session.data(for: request)

        // 🔍 Print response
        NetworkLogger.log(response: response, data: data)

        // Parse
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown(URLError(.badServerResponse))
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode, data: data)
        }
        
        do {
            let startTime = Date()
            let (data, response) = try await URLSession.shared.data(for: request)
            let duration = Date().timeIntervalSince(startTime)
            NetworkLogger.log(duration: duration)
            
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            NetworkLogger.log(error: error)
            throw NetworkError.decodingError(error)
        }
    }
}

