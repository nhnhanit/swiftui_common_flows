//
//  ProductDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductDetailView: View {
//    @StateObject var viewModel: ProductDetailViewModel
    @ObservedObject var cellVM: ProductCellViewModel
    
//    init(product: Product, coordinator: ProductCoordinator) {
//        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(product: product, coordinator: coordinator))
//    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cellVM.product.imageURL)) { phase in
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
            
            Text(cellVM.product.name)
                .font(.title)
                .padding()
            
            Text("$\(cellVM.product.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Button(action: {
                cellVM.toggleLike()
            }) {
                HStack {
                    Image(systemName: cellVM.product.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(cellVM.product.isLiked ? .red : .gray)
                    Text(cellVM.product.isLiked ? "Unlike" : "Like")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(cellVM.product.isLiked ? Color.red : Color.blue)
                .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Detail Product")
        .padding()
    }
}

#Preview {
    var alertManager = GlobalAlertManager()
    let mockCoordinator = AppCoordinator(alertManager: alertManager)
    let mockProductCoordinator = ProductCoordinator(appCoordinator: mockCoordinator)
    let product = Product(id: "1", name: "Sample Product", price: 29.99, imageURL: "http://example.com/image.jpg")
    let mockCellVM = ProductCellViewModel(product: product)
    
    ProductDetailView(cellVM: mockCellVM)
}
