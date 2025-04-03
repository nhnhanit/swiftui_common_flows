//
//  ProductListView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    
    var body: some View {
        VStack {
            Button("Add Product") {
                viewModel.addProduct()
            }
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
                            viewModel.goToProductDetail(product: product)
                        }
                    }
                }
                
            }
        }
        .navigationTitle("Product List")
        .onAppear {
            if viewModel.products.isEmpty {
                print("🔹 onAppear Calling loadProducts()")
                viewModel.loadProducts()
            } else {
                print("onAppear Dont refresh data")
            }
            
        }
    }
    
}

#Preview {
    let mockService = ProductListService.shared
    let mockCoordinator = AppCoordinator()
    let mockProductCoordinator = ProductCoordinator(appCoordinator: mockCoordinator)
    let mockViewModel = ProductListViewModel(service: mockService, coordinator: mockProductCoordinator)
    
    return ProductListView(viewModel: mockViewModel)
}
