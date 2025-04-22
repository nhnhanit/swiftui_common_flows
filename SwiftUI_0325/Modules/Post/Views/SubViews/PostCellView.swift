//
//  PostCellView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostCellView: View {
    @ObservedObject var viewModel: PostCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.post.title).font(.headline)
                Text(viewModel.post.body).lineLimit(2).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
            Button(action: viewModel.toggleLike) {
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}
