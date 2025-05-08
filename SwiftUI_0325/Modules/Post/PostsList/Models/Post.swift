//
//  Post.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import Foundation

struct Post: Identifiable, Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}
