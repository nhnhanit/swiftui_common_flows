//
//  PostRouteViewBuilder.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//

import SwiftUI

struct PostRouteViewBuilder {
    
    @ViewBuilder
    static func view(for route: PostRoute) -> some View {
        switch route {
        case .postDetail(_, let viewModel):
            PostDetailModule.build(viewModel: viewModel)
        }
    }
}
