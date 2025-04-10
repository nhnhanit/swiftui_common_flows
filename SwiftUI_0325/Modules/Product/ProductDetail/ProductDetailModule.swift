//
//  ProductDetailModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

final class ProductDetailModule {
    static func build(cellVM: ProductCellViewModel) -> ProductDetailView {
        
        return ProductDetailView(cellVM: cellVM)
    }
}
