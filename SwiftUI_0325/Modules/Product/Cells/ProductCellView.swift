//
//  ProductCellView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductCellView: View {
    @ObservedObject var viewModel: ProductCellViewModel
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
                Text(viewModel.product.name)
                    .font(.headline)
                Text("$\(viewModel.product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button(action: {
                    viewModel.likeButtonTapped()
                }) {
                    Image(systemName: viewModel.product.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
                .buttonStyle(PlainButtonStyle()) // ✅ Để không ảnh hưởng đến tap gesture
                .contentShape(Rectangle()) // Đảm bảo khu vực nhấn của nút
            }
            Spacer()
            
            // Nút Chuyển tiếp
            Button(action: {
                viewModel.cellTapped()
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
            if !viewModel.product.isLiked {
                viewModel.cellTapped()
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
            imageLoader.loadImage(from: viewModel.product.imageURL)
        }
    }
}

