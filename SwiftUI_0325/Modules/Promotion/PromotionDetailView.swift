//
//  PromotionDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct PromotionDetailView: View {
    @ObservedObject var coordinator: AppCoordinator
    let promotionID: Int
    
    var body: some View {
        VStack {
            Text("Promotion ID: \(promotionID)")
                .font(.title)
                .padding()
            Button("Back to Product Detail") {
//                coordinator.navigate(to: .product(.productList))
            }
        }
    }
}
