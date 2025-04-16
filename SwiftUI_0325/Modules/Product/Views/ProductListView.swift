//
//  ProductListView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    
    init(service: ProductService, coordinator: ProductCoordinator) {
        _viewModel = StateObject(wrappedValue: ProductListViewModel(service: service, coordinator: coordinator))
    }
    
    var body: some View {
        List(viewModel.productCells, id: \.id) { cellVM in
            ProductCellView(viewModel: cellVM)
                .onTapGesture {
                    viewModel.selectProduct(cellVM.product)
                }
        }
        .refreshable {
            viewModel.loadProducts()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.loadProducts()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .disabled(viewModel.isLoading) // prevent spam
            }
        }
        .navigationTitle("Products-2")
        .onAppear() {
            if viewModel.productCells.isEmpty {
                viewModel.loadProducts()
            }
        }
    }
}

#Preview {
    let mockCoordinator = ProductCoordinator(appCoordinator: AppCoordinator(alertManager: GlobalAlertManager()))
    let mockNetwork = MockNetworkServiceForPreview()
    let mockProductService = ProductService(network: mockNetwork)
    
    return ProductListView(service: mockProductService, coordinator: mockCoordinator)
}
