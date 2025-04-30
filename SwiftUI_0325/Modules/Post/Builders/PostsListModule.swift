//
//  PostsListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostsListModule {
    
    @MainActor
    static func build(postCoordinator: PostCoordinator, globalAlertManager: GlobalAlertManager) -> some View {
        let network = DefaultNetworkService()
        let postRepository = DefaultPostRepository(network: network,
                                                   postLocalStore: DefaultPostLocalStore())
        let viewModel = PostsListViewModel(
            postRepository: postRepository,
            postCoordinator: postCoordinator,
            globalAlertManager: globalAlertManager
        )
        
        return PostsListView(viewModel: viewModel)
    }
}
