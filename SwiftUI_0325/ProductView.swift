//
//  ProductView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
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
                    List(viewModel.products) { product in
                        ProductRowView(product: product)
                    }
                }
            }
            .navigationTitle("Products")
            .onAppear {
                viewModel.loadProducts()
            }
        }
    }
}

#Preview {
    ProductView()
}
