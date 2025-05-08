//
//  PhoneLoginAPI.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

enum PhoneLoginAPI: APIRequest {
    case requestOTP(phone: String)
    case verifyOTP(phone: String, otp: String)
    
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .requestOTP, .verifyOTP:
            return "/posts"
        }
    }
    
    var method: String {
        switch self {
        case .requestOTP, .verifyOTP:
            return "POST"
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json; charset=UTF-8"]
    }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var body: Data? {
        switch self {
        case .requestOTP(let phone):
            return try? JSONEncoder().encode(["title": phone, "body": phone, "userId": "1"])
        case .verifyOTP(let phone, let otp):
            return try? JSONEncoder().encode(["title": phone, "body": otp, "userId": "1"])
        }
    }
}
