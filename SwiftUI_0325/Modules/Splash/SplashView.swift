//
//  SplashView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel

    var body: some View {
        VStack {
            Text("Splash Screen")
                
        }
        .onAppear {
            viewModel.checkLoginStatus()
        }
    }
}

