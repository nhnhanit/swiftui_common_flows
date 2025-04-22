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
    case patchFavorite(postId: Int, isFavorite: Bool)
    
    var requiresAuthorization: Bool {
        switch self {
        case .fetchPosts, .patchFavorite:
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
        case .patchFavorite(let postId, _):
            return "/posts/\(postId)"
        }
    }
    
    var method: String {
        switch self {
        case .fetchPosts, .fetchComments, .fetchUser:
            return "GET"
        case .patchFavorite:
            return "PATCH"
        }
    }
    
    var headers: [String : String]? {
        authorizedHeaders(baseHeaders: ["Content-Type": "application/json; charset=UTF-8"])
    }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var body: Data? {
        switch self {
        case .patchFavorite(_, let isFavorite):
            let body = ["isFavorite": isFavorite]
            return try? JSONEncoder().encode(body)
        default:
            return nil
        }
    }
}
