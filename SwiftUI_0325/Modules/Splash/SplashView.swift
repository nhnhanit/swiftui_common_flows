//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: SplashViewModel())
    }

    var body: some View {
        VStack {
            Text("Splash Screen")
        }
        .onAppear {
            viewModel.checkLoginStatus()
        }
    }
}

#Preview {
    SplashModule.build()
}

