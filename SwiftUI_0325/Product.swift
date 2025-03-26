//
//  Untitled.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String
}
