//
//  ProductViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func loadProducts() {
        isLoading = true
        errorMessage = nil

        ProductService.shared.fetchProducts { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
