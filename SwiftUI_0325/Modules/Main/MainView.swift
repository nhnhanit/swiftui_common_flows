//
//  MainView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    init(coordinator: AppCoordinator) {
        _viewModel = StateObject(wrappedValue: MainViewModel(coordinator: coordinator))
    }
    
    @State private var selectedTab = MainTab.productList

    enum MainTab {
        case productList
        case settings
    }

    var body: some View {
        TabView(selection: $selectedTab) {
//            NavigationStack {
                ProductListModule.build(coordinator: ProductCoordinator(appCoordinator: viewModel.coordinator))
//            }
            .tabItem {
                Label("Products", systemImage: "list.bullet")
            }
            .tag(MainTab.productList)
            .navigationTitle("Products")

//            NavigationStack {
                SettingsModule.build(coordinator: SettingsCoordinator(appCoordinator: viewModel.coordinator))
//            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
            .tag(MainTab.settings)
            .navigationTitle("Settings")
        }
    }
}

