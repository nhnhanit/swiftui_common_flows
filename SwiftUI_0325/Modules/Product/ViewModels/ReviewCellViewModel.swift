//
//  ReviewCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
struct ReviewCellViewModel: Identifiable {
    let id: UUID
    let userName: String
    let description: String

    init(review: Review) {
        self.id = review.id
        self.userName = review.userName
        self.description = review.description
    }
}
