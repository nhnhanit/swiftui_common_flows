//
//  PostCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

class PostCoordinator: ObservableObject {
    private weak var appCoordinator: Navigatable?
    
    init(appCoordinator: Navigatable) {
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
