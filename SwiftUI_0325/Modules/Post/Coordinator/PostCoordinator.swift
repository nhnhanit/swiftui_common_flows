//
//  PostCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

class PostCoordinator: ObservableObject {
    private weak var appCoordinator: (Navigatable)?
    
    init(appCoordinator: (Navigatable)) {
        self.appCoordinator = appCoordinator
    }
    
    func goToPostDetail(postId: Int, detailVM: PostDetailViewModel) {
        if let appCoordinator = appCoordinator {
            appCoordinator.push(to: .postRoute(.postDetail(postId: postId, detailVM: detailVM)))
        } else {
            print("appCoordinator is nil")
        }
    }
    
}

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
