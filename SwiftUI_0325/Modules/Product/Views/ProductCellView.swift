//
//  ProductCellView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct ProductCellView: View {
    @ObservedObject var viewModel: ProductCellViewModel

    var body: some View {
        HStack {
            Text(viewModel.product.name)
            Spacer()
            Button(action: viewModel.toggleLike) {
                Image(systemName: viewModel.product.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}
