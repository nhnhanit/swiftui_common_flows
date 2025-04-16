//
//  MockNetworkServiceForPreview.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

final class MockNetworkServiceForPreview: NetworkService {
    func request<T>(_ endpoint: APIRequest) async throws -> T where T : Decodable {
        switch endpoint {
        case is ProductAPI:
            if T.self == [Product].self {
                let sample = [Product(id: "1", name: "Mock Product", isLiked: false)]
                return sample as! T
            } else if T.self == Shop.self {
                let shop = Shop(id: "1", name: "Mock Shop", address: "123 Mock St")
                return shop as! T
            } else if T.self == [Review].self {
                let reviews = [Review(id: "1", author: "Mark", comment: "Great!", rating: 5)]
                return reviews as! T
            }
        default:
            break
        }
        throw URLError(.cannotDecodeContentData)
    }
}
