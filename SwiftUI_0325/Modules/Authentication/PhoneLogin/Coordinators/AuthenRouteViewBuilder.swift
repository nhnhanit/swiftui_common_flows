//
//  AuthenRouteViewBuilder.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//


import SwiftUI

struct AuthenRouteViewBuilder {
    
    @MainActor
    @ViewBuilder
    static func view(for route: AuthenRoute) -> some View {
        switch route {
        case .OTPVerity(let phone):
            OTPVerifyModule.build(phone: phone)
        }
    }
}
