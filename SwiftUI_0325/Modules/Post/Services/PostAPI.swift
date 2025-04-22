//
//  PostAPI.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

enum PostAPI: APIRequest, AuthorizedRequestBuilder {
    case fetchPosts
    case fetchComments(postId: String)
    case fetchUser(userId: String)
    
    var requiresAuthorization: Bool {
        switch self {
        case .fetchPosts:
            return false // API public dont need accessToken
        case .fetchComments, .fetchUser:
            return true
        }
    }
    
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .fetchPosts:
            return "/posts"
        case .fetchComments(let postId):
            return "/posts/\(postId)/comments"
        case .fetchUser(let userId):
            return "/users/\(userId)"
        }
    }
    
    var method: String {
        switch self {
        case .fetchPosts, .fetchComments, .fetchUser:
            return "GET"
        }
    }
    
    var headers: [String : String]? {
        authorizedHeaders(baseHeaders: ["Content-Type": "application/json; charset=UTF-8"])
    }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var body: Data? { nil }
}
