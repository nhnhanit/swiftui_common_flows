//
//  ProductListViewModel.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

@MainActor
final class ProductListViewModel: ObservableObject {
    private let productService: ProductService
    private let coordinator: ProductCoordinator
    @Published var productCells: [ProductCellViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(service: ProductService, coordinator: ProductCoordinator) {
        print("🔁 ProductListViewModel INIT")
        
        self.productService = service
        self.coordinator = coordinator
        
        Task {
            await fetchProducts()
        }
    }
    
    deinit {
        print("❌ DEINIT ProductListViewModel")
    }
    
    func fetchProducts() async {
        isLoading = true
        errorMessage = nil
        
        do {
            productCells = try await productService.fetchProducts().map {
                ProductCellViewModel(product: $0, service: productService)
            }
        } catch {
            errorMessage = "Failed to load products: \(error.localizedDescription)"
            print(errorMessage as Any)
        }
        
        isLoading = false
    }
    
    
    @MainActor func selectProduct(_ product: Product) {
        let detailVM = ProductDetailViewModel(product: product, service: productService)
        
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
