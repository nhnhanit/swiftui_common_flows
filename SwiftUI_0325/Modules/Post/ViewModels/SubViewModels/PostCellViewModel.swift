//
//  PostCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class PostCellViewModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var post: Post
    private let service: PostServicing

    init(post: Post, service: PostServicing) {
        self.post = post
        self.service = service
    }
    
    func toggleFavorite() {
        post.isFavorite.toggle()
    }

}
