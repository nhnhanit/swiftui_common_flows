//
//  RootView+PostRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

enum PostRoute: Hashable {
    
    case postDetail(postId: Int, detailVM: PostDetailViewModel)
    
    static func == (lhs: PostRoute, rhs: PostRoute) -> Bool {
        switch (lhs, rhs) {
        case let (.postDetail(p1, _), .postDetail(p2, _)):
            return p1 == p2
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .postDetail(id, _):
            hasher.combine(id)
        }
    }
}

extension RootView {
    @ViewBuilder
    func handlePostRoute(_ route: PostRoute) -> some View {
        switch route {
        case .postDetail(_, let detailVM):
            PostDetailView(viewModel: detailVM)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}
