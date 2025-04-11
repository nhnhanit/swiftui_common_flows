//
//  ProductDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(viewModel.product.name).font(.title)
                    Spacer()
                    Button(action: viewModel.toggleLike) {
                        Image(systemName: viewModel.product.isLiked ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                }

                if let shop = viewModel.shop {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Shop: \(shop.name)").font(.headline)
                        Text("Address: \(shop.address)").font(.subheadline)
                    }
                } else {
                    ProgressView("Loading shop...")
                }

                Text("Reviews").font(.headline)
                ForEach(viewModel.reviewCellViewModels) { cellVM in
                    ReviewCellView(viewModel: cellVM)
                }
            }
            .padding()
        }
        .navigationTitle("Detail")
    }
}
