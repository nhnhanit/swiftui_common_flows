//
//  ProductListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var likedProducts: [String: Bool] = [:] // ✅ Lưu trạng thái like
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: ProductListService
    var coordinator: ProductCoordinator
    
    init(service: ProductListService, coordinator: ProductCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func addProduct() {
        let product4 = Product(id: UUID().uuidString,
                               name: "Laptop", price: 1200.0,
                               imageURL: "https://picsum.photos/id/240/200/300",
                               isLiked: true)
        products.append(product4)
    }

    func loadProducts() {
        service.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    print(products)
                    self?.products = products.map { product in
                        let updatedProduct = product
                        updatedProduct.isLiked = self?.likedProducts[product.id] ?? false
                        return updatedProduct
                    }
                }
            case .failure(let error):
                print("❌ Error fetching products:", error)
            }
        }
    }
    
    func toggleLike(for productID: String) {
        if let index = products.firstIndex(where: { $0.id == productID }) {
            products[index].toggleLike()
            likedProducts[productID] = products[index].isLiked
        }
    }

    func goToProductDetail(product: Product) {
        coordinator.goToProductDetail(product: product, viewModel: self)
    }
    
}
