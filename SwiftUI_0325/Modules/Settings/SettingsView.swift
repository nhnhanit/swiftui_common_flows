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
            Text("Settings")

            Button("Logout") {
                viewModel.logout()
            }
        }
    }
}
