//
//  ProfileView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text("Profile Screen")
            Button("Back to Product Detail") {
                coordinator.navigate(to: .product(.productDetail(productID: "3")))
            }
        }
    }
}
