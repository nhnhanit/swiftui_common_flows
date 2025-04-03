//
//  ProductRowView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductRowView: View {
    @ObservedObject var product: Product
    @StateObject private var imageLoader = ImageLoader()
    let onSelect: (Product) -> Void
    
    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button(action: {
                product.toggleLike()
            }) {
                Image(systemName: product.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(product.isLiked ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle()) // ✅ Để không ảnh hưởng đến tap gesture
            .contentShape(Rectangle())
            
            Button(action: {
                onSelect(product)
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
        }
        .onTapGesture {
            onSelect(product)
        }
        .onAppear {
            imageLoader.loadImage(from: product.imageURL)
        }
    }
}

