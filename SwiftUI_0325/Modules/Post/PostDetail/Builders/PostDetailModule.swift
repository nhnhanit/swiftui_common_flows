//
//  PostDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/5/25.
//

struct PostDetailModule {
    
    static func build(viewModel: PostDetailViewModel) ->PostDetailView {
        return PostDetailView(viewModel: viewModel)
    }
}
