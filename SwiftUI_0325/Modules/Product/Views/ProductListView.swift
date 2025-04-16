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
        ZStack {
            VStack(spacing: 0) {
                TopBarView(
                    title: "Products",
                    rightIcon: "arrow.clockwise",
                    rightAction: {
                        viewModel.loadProducts()
                    }
                )

                if viewModel.productCells.isEmpty && !viewModel.isLoading {
                    Spacer()
                    EmptyStateView(
                        title: "No Products",
                        message: "You can refresh or try again later.",
                        imageName: "shippingbox",
                        retryAction: {
                            viewModel.loadProducts()
                        }
                    )
                    Spacer()
                } else {
                    List(viewModel.productCells, id: \.id) { cellVM in
                        ProductCellView(viewModel: cellVM)
                            .onTapGesture {
                                viewModel.selectProduct(cellVM.product)
                            }
                    }
                    .refreshable {
                        viewModel.loadProducts()
                    }
                }
            }

            if viewModel.isLoading {
                LoadingView(message: "Loading products...")
            }
        }
        .onAppear {
            if viewModel.productCells.isEmpty {
                viewModel.loadProducts()
            }
        }
        .onDisappear {
            viewModel.cancelLoading()
        }
    }
}

#Preview {
    let mockCoordinator = ProductCoordinator(appCoordinator: AppCoordinator(alertManager: GlobalAlertManager()))
    let mockNetwork = MockNetworkServiceForPreview()
//    mockNetwork.returnEmptyProducts = true
    
    let mockProductService = ProductService(network: mockNetwork)
    
    return ProductListView(service: mockProductService, coordinator: mockCoordinator)
}
