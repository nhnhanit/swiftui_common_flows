//
//  NetworkError.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import SwiftUI

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case decodingError(Error)
    case serverError(statusCode: Int, data: Data?)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .decodingError(let err): return "Decoding failed: \(err.localizedDescription)"
        case .serverError(let code, _): return "Server returned status code \(code)."
        case .unknown(let err): return err.localizedDescription
        }
    }
}
