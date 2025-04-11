//
//  NetworkService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//


protocol NetworkService {
    func request<T: Decodable>(_ endpoint: APIRequest) async throws -> T
}