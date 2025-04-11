//
//  DefaultNetworkService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

final class DefaultNetworkService: NetworkService {
    func request<T: Decodable>(_ endpoint: APIRequest) async throws -> T {
        var components = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)!
        components.queryItems = endpoint.queryItems

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body

        // 🔍 Print request
//        debugPrint("➡️ Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields {
//            debugPrint("🧾 Headers: \(headers)")
        }
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
//            debugPrint("📦 Body: \(bodyString)")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        // 🔍 Print response
        if let httpResponse = response as? HTTPURLResponse {
//            debugPrint("⬅️ Response: \(httpResponse.statusCode) from \(request.url?.absoluteString ?? "")")
        }

        if let responseString = String(data: data, encoding: .utf8) {
//            debugPrint("📥 Response Body: \(responseString)")
        }

        // Parse
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}

