//
//  PostsListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

final class PostsListModule {
    static func build(coordinator: PostCoordinator, alertManager: GlobalAlertManager) -> PostsListView {
        let network = DefaultNetworkService()
        let postService = PostService(network: network)
        
        return PostsListView(service: postService, coordinator: coordinator, alertManager: alertManager)
    }
}
