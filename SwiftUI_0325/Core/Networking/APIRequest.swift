//
//  APIRequest.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

protocol APIRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}
