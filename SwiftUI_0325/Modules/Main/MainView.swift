//
//  MainView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    init(coordinator: AppCoordinator, alertManager: GlobalAlertManager) {
        _viewModel = StateObject(wrappedValue: MainViewModel(coordinator: coordinator,
                                                             alertManager: alertManager))
    }
    
    @State private var selectedTab = MainTab.productList
    
    enum MainTab {
        case productList
        case settings
        
        var title: String {
            switch self {
            case .productList:
                return "Products"
            case .settings:
                return "Settings"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                ProductListModule.build(coordinator: ProductCoordinator(appCoordinator: viewModel.coordinator), alertManager: viewModel.alertManager)
                    .tabItem {
                        Label("Products", systemImage: "list.bullet")
                    }
                    .tag(MainTab.productList)
                
                SettingsModule.build(coordinator: SettingsCoordinator(appCoordinator: viewModel.coordinator), alertManager: viewModel.alertManager)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .tag(MainTab.settings)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

