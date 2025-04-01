//
//  ProductDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.product.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(12)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(viewModel.product.name)
                .font(.title)
                .padding()
            
            Text("$\(viewModel.product.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Button(action: {
                viewModel.toggleLike()
            }) {
                HStack {
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isLiked ? .red : .gray)
                    Text(viewModel.isLiked ? "Unlike" : "Like")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(viewModel.isLiked ? Color.red : Color.blue)
                .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}
