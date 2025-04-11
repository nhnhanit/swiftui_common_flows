//
//  ReviewCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
struct ReviewCellViewModel: Identifiable {
    let id: String
    let author: String
    let comment: String
    let rating: String

    init(review: Review) {
        self.id = review.id
        self.author = "Author: " + review.author
        self.comment = review.comment
        self.rating = "Rating: \(review.rating)"
    }
}
