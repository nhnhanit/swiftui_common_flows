//
//  MockProductService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

final class MockNetworkService: NetworkService {
    var result: Any?
    var shouldFail = false
    
    func request<T: Decodable>(_ endpoint: APIRequest) async throws -> T {
        if shouldFail {
            throw URLError(.badServerResponse)
        }
        
        guard let result = result as? T else {
            fatalError("MockNetworkService: result không đúng kiểu \(T.self)")
        }
        
        return result
    }
}
