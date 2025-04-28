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
        let localStore = DefaultPostLocalStore()
        let postRepository = DefaultPostRepository(network: network, localStore: localStore)
        let postUseCase = DefaultPostUseCase(repository: postRepository)
        
        return PostsListView(postUseCase: postUseCase, coordinator: coordinator, alertManager: alertManager)
    }
}
