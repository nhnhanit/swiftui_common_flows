//
//  Review.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct Review: Identifiable, Hashable, Decodable {
    let id: String
    let author: String
    let comment: String
    let rating: Int
}
