//
//  PostDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/5/25.
//

import SwiftUI

struct PostDetailModule {
    
    @ViewBuilder
    static func build(viewModel: PostDetailViewModel) -> some View {
        PostDetailView(viewModel: viewModel)
    }
}
