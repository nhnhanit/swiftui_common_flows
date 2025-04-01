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
    
    private let service: ProductService
    var coordinator: AppCoordinator
    
    init(service: ProductService, coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func loadProducts() {
        service.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self?.products = products
                }
            case .failure(let error):
                print("❌ Error fetching products:", error)
            }
        }
    }
    
    func goToProductDetail(productID: String) {
//        coordinator.navigate(to: .product(.productDetail(productID: productID)))
    }
}
