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
    let onSelect: ((Product) -> Void)?
    
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
            
            // Nút Like
            Button(action: {
                product.toggleLike()
            }) {
                Image(systemName: product.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(product.isLiked ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle()) // ✅ Để không ảnh hưởng đến tap gesture
            .contentShape(Rectangle()) // Đảm bảo khu vực nhấn của nút
            
            // Nút Chuyển tiếp
            Button(action: {
                onSelect?(product)
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
        }
        // Sự kiện nhấn trên HStack, loại trừ nút Like
        .contentShape(Rectangle()) // Tối ưu vùng để tap
        .onTapGesture {
            // Không làm gì nếu tap ở nút like
            // Phải đảm bảo rằng sự kiện tap không chạy khi nhấn vào nút like
            if !product.isLiked {
                onSelect?(product) // Kích hoạt onSelect
            }
        }
        .background(
            Color.clear // Đảm bảo nút like không kích hoạt onSelect
                .contentShape(Rectangle())
                .onTapGesture {
                    // Do nothing here to exclude the button
                }
        )
        .onAppear {
            imageLoader.loadImage(from: product.imageURL)
        }
    }
}

