//
//  TopBarView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 16/4/25.
//

import SwiftUI

struct TopBarView: View {
    let title: String
    let rightAction: (() -> Void)?
    let rightIcon: String?

    init(title: String, rightIcon: String? = nil, rightAction: (() -> Void)? = nil) {
        self.title = title
        self.rightIcon = rightIcon
        self.rightAction = rightAction
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()

            Spacer()

            if let icon = rightIcon, let action = rightAction {
                Button(action: action) {
                    Image(systemName: icon)
                        .font(.title3)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        .padding(.bottom, 4)
        .background(Color(.systemBackground))
        .overlay(Divider(), alignment: .bottom)
    }
}
