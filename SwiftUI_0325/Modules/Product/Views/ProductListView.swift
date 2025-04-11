//
//  ProductListView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel

    init(service: ProductServiceProtocol, coordinator: ProductCoordinator) {
        _viewModel = StateObject(wrappedValue: ProductListViewModel(service: service, coordinator: coordinator))
    }
    
    var body: some View {
        List(viewModel.productCells, id: \.id) { cellVM in
            ProductCellView(viewModel: cellVM)
                .onTapGesture {
                    viewModel.selectProduct(cellVM.product)
                }
        }
        .navigationTitle("Products")
    }
}
