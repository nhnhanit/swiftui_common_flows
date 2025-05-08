//
//  PostRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


enum PostRoute: Hashable {
    
    case postDetail(postId: Int, detailVM: PostDetailViewModel)
    
    static func == (lhs: PostRoute, rhs: PostRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.postDetail(p1, _), .postDetail(p2, _)):
            return p1 == p2
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .postDetail(id, _):
            hasher.combine(id)
        }
    }
}
