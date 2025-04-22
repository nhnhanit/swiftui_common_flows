//
//  PostsListView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel: PostsListViewModel
    
    init(service: PostService, coordinator: PostCoordinator, alertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: PostsListViewModel(service: service, coordinator: coordinator, alertManager: alertManager))
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TopBarView(
                    title: "Posts",
                    rightIcon: "arrow.clockwise",
                    rightAction: {
                        viewModel.loadPosts()
                    }
                )

                if viewModel.postCells.isEmpty && !viewModel.isLoading {
                    Spacer()
                    EmptyStateView(
                        title: "No Posts",
                        message: "You can refresh or try again later.",
                        imageName: "shippingbox",
                        retryAction: {
                            viewModel.loadPosts()
                        }
                    )
                    Spacer()
                } else {
                    List(viewModel.postCells, id: \.id) { cellVM in
                        PostCellView(viewModel: cellVM)
                            .onTapGesture {
                                viewModel.selectPost(cellVM.post)
                            }
                    }
                    .refreshable {
                        viewModel.loadPosts()
                    }
                }
            }

            if viewModel.isLoading {
                LoadingView(message: "Loading posts...")
            }
        }
        .onAppear {
            if viewModel.postCells.isEmpty {
                viewModel.loadPosts()
            }
        }
        .onDisappear {
            viewModel.cancelLoading()
        }
    }
}

