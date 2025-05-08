//
//  PostCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

protocol PostCoordinator: ObservableObject {
    func goToPostDetail(postId: Int, detailVM: PostDetailViewModel)
}

class DefaultPostCoordinator: PostCoordinator {
    func goToPostDetail(postId: Int, detailVM: PostDetailViewModel) {
        EnvironmentContainer.appCoordinator.push(to: .postRoute(.postDetail(postId: postId, detailVM: detailVM)))
    }
}
