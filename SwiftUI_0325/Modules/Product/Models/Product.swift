//
//  Product.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct Product: Identifiable, Hashable, Decodable {
    let id: String
    let name: String
    var isLiked: Bool
}
