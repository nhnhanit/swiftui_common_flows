//
//  ContentView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

let mockData = """
[
    { "id": "1", "name": "iPhone 15", "price": 999.99, "imageURL": "https://picsum.photos/id/237/200/300", "isLiked": true },
    { "id": "2", "name": "MacBook Pro", "price": 1999.99, "imageURL": "https://picsum.photos/id/238/200/300", "isLiked": true },
    { "id": "3", "name": "Apple Watch", "price": 399.99, "imageURL": "https://picsum.photos/id/239/200/300", "isLiked": true }
]
""".data(using: .utf8)!
struct ContentView: View {
    @State var products: [Product] = []

    var body: some View {
        VStack {
            List(products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Button(action: {
                        product.toggleLike()
                    }) {
                        Image(systemName: product.isLiked ? "heart.fill" : "heart")
                    }
                }
            }
        }
        .onAppear {
            do {
                products = try JSONDecoder().decode([Product].self, from: mockData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
