//
//  PostLocalStore.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI
import RealmSwift

protocol PostLocalStore {
    func save(posts: [Post]) throws
    func loadCachedPosts() -> [Post]
}

final class DefaultPostLocalStore: PostLocalStore {
    
    func save(posts: [Post]) throws {
        let realm = try Realm()
        let objects = posts.map { RealmPost(post: $0) }
        try realm.write {
            realm.add(objects, update: .modified)
        }
    }
    
    func loadCachedPosts() -> [Post] {
        let realm = try! Realm()
        return realm.objects(RealmPost.self)
            .sorted(byKeyPath: "id", ascending: true)
            .map { $0.toPost }
    }
}
