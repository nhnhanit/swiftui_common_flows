//
//  CommentCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
struct CommentCellViewModel: Identifiable {
    let id: Int
    let name: String
    let body: String

    init(comment: Comment) {
        self.id = comment.id
        self.name = "Name: " + comment.name
        self.body = comment.body
    }
}
