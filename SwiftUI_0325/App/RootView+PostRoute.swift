//
//  RootView+PostRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

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
