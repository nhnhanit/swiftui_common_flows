//
//  ProductCellViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 10/4/25.
//

import SwiftUI

class ProductCellViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let product: Product

    @Published var isLoading: Bool = false
    var onSelectCell: (() -> Void)?

    init(product: Product) {
        self.product = product
    }

    func likeButtonTapped() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.isLoading = false
            self.product.isLiked.toggle()
        }
    }
    
    func cellTapped() {
        onSelectCell?()
    }
}
