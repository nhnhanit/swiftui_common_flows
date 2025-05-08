//
//  RealmPost.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import RealmSwift

final class RealmPost: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var userId: Int
    @Persisted var title: String
    @Persisted var body: String
    @Persisted var isFavorite: Bool = false

    convenience init(post: Post) {
        self.init()
        self.id = post.id
        self.userId = post.userId
        self.title = post.title
        self.body = post.body
        self.isFavorite = post.isFavorite
    }

    var toPost: Post {
        Post(
            userId: userId,
            id: id,
            title: title,
            body: body,
            isFavorite: isFavorite
        )
    }
}
