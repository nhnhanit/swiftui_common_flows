//
//  SamplePosts.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


import Foundation

enum SamplePosts {
    static let posts: [Post] = [
        Post(userId: 1, id: 1, title: "Sample Post 1", body: "Lorem ipsum", isFavorite: false),
        Post(userId: 2, id: 2, title: "Sample Post 2", body: "Dolor sit amet", isFavorite: false),
        Post(userId: 3, id: 3, title: "Sample Post 3", body: "Consectetur adipiscing", isFavorite: true)
    ]
    
    static let postComments: [PostComment] = [
        PostComment(id: 1, postId: 1, body: "comment body", name: "name comment", email: "email comment")
    ]
    
    static let userInfo: UserInfo = UserInfo(id: 1, name: "name", email: "user email ipsum", phone: "123456789")
    
    static let post: Post = Post(userId: 1, id: 1, title: "Sample Post 1", body: "Lorem ipsum", isFavorite: false)
    
}
