//
//  PostsListView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostsListView<ViewModel: PostsListViewModeling>: View {
    @StateObject private var viewModel: ViewModel

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
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
                    List {
                        ForEach(viewModel.postCells, id: \.id) { cellVM in
                            PostCellView(viewModel: cellVM)
                                .onTapGesture {
                                    viewModel.selectPost(cellVM.post)
                                }
                        }
                        .onDelete { indexSet in
                            Task {
                                await viewModel.deletePost(at: indexSet)
                            }
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
            viewModel.loadPostsIfNeeded()
        }
        .onDisappear {
            viewModel.cancelLoading()
        }
    }
}


struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        let previewPostRepository = PreviewPostRepository()
        let postCoordinator = DefaultPostCoordinator()
        
        let viewModel = PostsListViewModel(
            postRepository: previewPostRepository,
            postCoordinator: postCoordinator
        )
        
        return PostsListView(viewModel: viewModel)
    }
}
