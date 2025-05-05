//
//  MainTabView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel: MainViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: MainViewModel())
    }
    
    @State private var selectedTab = MainTab.postList
    
    enum MainTab {
        case postList
        case settings
        
        var title: String {
            switch self {
            case .postList:
                return "Posts"
            case .settings:
                return "Settings"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                PostsListModule.build(postCoordinator: PostCoordinator())
                    .tabItem {
                        Label("Posts", systemImage: "list.bullet")
                    }
                    .tag(MainTab.postList)
                
                SettingsModule.build(settingCoordinator: SettingCoordinator())
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .tag(MainTab.settings)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

