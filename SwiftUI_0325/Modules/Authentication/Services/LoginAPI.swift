//
//  LoginAPI.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

enum LoginAPI: APIRequest {
    case login(username: String, password: String)

    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var path: String {
        switch self {
        case .login:
            return "/users"
        }
    }

    var method: String {
        switch self {
        case .login:
            return "GET"
        }
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .login(let username, _):
            return [
                URLQueryItem(name: "username", value: username)
            ]
        }
    }

    var body: Data? { nil }
}
