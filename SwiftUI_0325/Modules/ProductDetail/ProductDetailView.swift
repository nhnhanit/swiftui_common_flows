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
            Text("Product Detail for ID: \(viewModel.productId)")
                .font(.title)
                .padding()
        }
        .navigationTitle("Product Detail")
    }
}
