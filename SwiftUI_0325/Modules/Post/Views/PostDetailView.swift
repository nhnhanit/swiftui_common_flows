//
//  PostDetailView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import SwiftUI

struct PostDetailView: View {
    @ObservedObject var viewModel: PostDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Post Info
                Text(viewModel.post.title)
                    .font(.title2)
                    .fontWeight(.bold)

                Text(viewModel.post.body)
                    .font(.body)
            
                // Author Info
                if let userInfo = viewModel.userInfo {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Author name: \(userInfo.name)").font(.headline)
                        Text("Phone: \(userInfo.phone)").font(.subheadline)
                    }
                } else {
                    ProgressView("Loading user info...")
                }

                // Comment list
                Text("Comments").font(.headline)
                ForEach(viewModel.commentCellViewModels) { cellVM in
                    CommentCellView(viewModel: cellVM)
                }
            }
            .padding()
        }
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
