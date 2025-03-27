//
//  ProductRowView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import SwiftUI

struct ProductRowView: View {
    let product: Product
    let onSelect: (Product) -> Void // Callback for selection
    @StateObject private var imageLoader = ImageLoader()
    
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
                onSelect(product) // Notify parent when tapped
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
        }
        .contentShape(Rectangle()) // Make whole row tappable
        .onTapGesture {
            onSelect(product)
        }
        .onAppear {
            imageLoader.loadImage(from: product.imageURL)
        }
    }
}
