//
//  RootView+ProductRoute.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

import SwiftUI

extension RootView {    
    @ViewBuilder
    func handleProductRoute(_ route: ProductRoute) -> some View {
        switch route {
        case .productDetail(_, let detailVM):
            ProductDetailView(viewModel: detailVM)
            
        @unknown default:
            Text("Undefined")
                .foregroundColor(.red)

        }
    }
}
