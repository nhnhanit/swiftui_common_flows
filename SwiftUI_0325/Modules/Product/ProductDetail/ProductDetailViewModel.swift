//
//  ProductDetailViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import Foundation

protocol ProductDetailDelegate: AnyObject {
    func productDetail(_ productDetail: ProductDetailViewModel, didChangeLikeFor productID: String, isLiked: Bool)
}


final class ProductDetailViewModel: ObservableObject {
    private let coordinator: ProductCoordinator
    var product: Product
    @Published var isLiked: Bool
    weak var delegate: ProductDetailDelegate?

    init(product: Product, coordinator: ProductCoordinator, delegate: ProductDetailDelegate?) {
        self.coordinator = coordinator
        self.product = product
        self.isLiked = product.isLiked
        self.delegate = delegate
    }
    
    func toggleLike() {
        isLiked.toggle()
        product.isLiked = isLiked // Cập nhật giá trị trong product
        delegate?.productDetail(self, didChangeLikeFor: product.id, isLiked: isLiked)
    }
}
