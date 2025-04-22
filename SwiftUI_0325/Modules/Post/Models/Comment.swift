//
//  Comment.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import Foundation

struct Comment: Identifiable, Codable {
    let id: Int
    let postId: Int
    let body: String
    let name: String
    let email: String
}

