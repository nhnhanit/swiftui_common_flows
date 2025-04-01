//
//  MainView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        TabView {
            ProductModule.build(coordinator: viewModel.coordinator)
                .tabItem { Label("Products", systemImage: "list.bullet") }
            SettingsModule.build(coordinator: viewModel.coordinator)
                .tabItem { Label("Settings", systemImage: "gearshape")
                }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

