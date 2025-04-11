//
//  ProductListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class ProductListViewModel: ObservableObject {
    @Published var productCells: [ProductCellViewModel] = []
    private let service: ProductServiceProtocol
    private let coordinator: ProductCoordinator

    init(service: ProductServiceProtocol, coordinator: ProductCoordinator) {
        self.service = service
        self.coordinator = coordinator
        fetchProducts()
        
        print("🔁 ProductListViewModel INIT")
    }
    
    deinit {
        print("❌ DEINIT ProductListViewModel")
    }

    func fetchProducts() {
        productCells = service.fetchProducts().map {
            ProductCellViewModel(product: $0, service: service)
        }
    }

    @MainActor func selectProduct(_ product: Product) {
        let detailVM = ProductDetailViewModel(product: product, service: service)
        
        // 👇 Callback from Detail to List
        detailVM.onUpdate = { [weak self] updatedProduct in
            guard let self else { return }
            if let index = self.productCells.firstIndex(where: { $0.product.id == updatedProduct.id }) {
                self.productCells[index].product = updatedProduct
            }
        }
        
        coordinator.goToProductDetail(productID: product.id, detailVM: detailVM)
    }
}
