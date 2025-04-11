//
//  Product.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    var isLiked: Bool
}
