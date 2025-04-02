//
//  SettingsView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        VStack {
            Text("Press log out button to go to Splash Screen")

            Button("Logout") {
                viewModel.logout()
            }
        }
        .navigationTitle("Settings Screen")
    }
}
