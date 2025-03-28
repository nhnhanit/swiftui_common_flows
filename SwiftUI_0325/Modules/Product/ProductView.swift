//
//  ProductView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading products...")
            } else if let errorMessage = viewModel.errorMessage {
                VStack {
                    Text("❌ \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                    Button(action: {
                        viewModel.loadProducts()
                    }) {
                        Text("Retry")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            } else {
                Text("Products count: \(viewModel.products.count)")
                    .font(.caption)
                    .foregroundColor(.gray)
                if viewModel.products.isEmpty {
                    Text("No products available")
                } else {
                    List(viewModel.products, id: \.id) { product in
                        ProductRowView(product: product) { selectedProduct in
                            viewModel.goToProductDetail(productID: selectedProduct.id)
                        }
                    }
                }
                
            }
        }
        .navigationTitle("Products")
        .onAppear {
            print("🔹 Calling loadProducts()")
            viewModel.loadProducts()
        }
    }
    
}

#Preview {
    let mockService = ProductService.shared
    let mockCoordinator = AppCoordinator()
    let mockViewModel = ProductViewModel(service: mockService, coordinator: mockCoordinator)
    
    return ProductView(viewModel: mockViewModel)
}
