//
//  Untitled.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import Foundation

struct Product: Identifiable, Decodable, Hashable {
    let id: String
    let name: String
    let price: Double
    let imageURL: String

    // ✅ Hash only `id`
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
