//
//  ProductAPI.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

enum ProductAPI: APIRequest {
    case fetchProducts
    case fetchShop(shopID: String)
    case fetchReviews(productID: String)

    var baseURL: URL { URL(string: "https://run.mocky.io")! }

    var path: String {
        switch self {
        case .fetchProducts:
            return "/v3/ac302462-42d7-4167-bf6f-dd2a1bd047a3"
        case .fetchShop:
            return "/v3/47b077d4-7900-436b-9e2a-f0e7e5980c08"
        case .fetchReviews:
            return "/v3/d4bfe324-63a3-4f1a-b1f5-af466b24cd0c"
        }
    }

    var method: String {
        switch self {
        case .fetchProducts:
            return "GET"
        case .fetchShop, .fetchReviews:
            return "POST"
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var queryItems: [URLQueryItem]? { nil }

    var body: Data? {
        switch self {
        case .fetchShop(let shopID):
            return try? JSONEncoder().encode(["shopID": shopID])
        case .fetchReviews(let productID):
            return try? JSONEncoder().encode(["productID": productID])
        default:
            return nil
        }
    }
}
