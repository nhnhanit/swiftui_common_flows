//
//  PostsListModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostsListModule {
    
    @MainActor
    @ViewBuilder
    static func build() -> some View {
        let networkService = DefaultNetworkService()
        let postLocalDataSource = DefaultPostLocalDataSource()
        let postRepository = DefaultPostRepository(networkService: networkService,
                                                   postLocalDataSource: postLocalDataSource)
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(
            postRepository: postRepository,
            postCoordinator: postCoordinator
        )
        
        return PostsListView(viewModel: viewModel)
    }
}
