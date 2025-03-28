//
//  PromotionDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct PromotionDetailView: View {
    let promotionID: Int
    
    var body: some View {
        Text("Promotion ID: \(promotionID)")
            .font(.title)
            .padding()
    }
}
