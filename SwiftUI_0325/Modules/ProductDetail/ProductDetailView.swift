//
//  ProductDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
            Text("Price: \(product.price, specifier: "%.2f")$")
        }
        .navigationTitle("Product Detail")
    }
}
