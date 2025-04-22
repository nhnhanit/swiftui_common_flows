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

                // Post Header: Title + Favorite
                HStack {
                    Text(viewModel.post.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Image(systemName: viewModel.post.isFavorite ? "star.fill" : "star")
                            .foregroundColor(viewModel.post.isFavorite ? .yellow : .gray)
                    }
                    .buttonStyle(.plain)
                }

                // Body
                Text(viewModel.post.body)
                    .font(.body)

                // Author Info
                Group {
                    Text("Author").font(.headline)
                    if let userInfo = viewModel.userInfo {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Name: \(userInfo.name)")
                            Text("Phone: \(userInfo.phone)")
                        }
                        .font(.subheadline)
                    } else {
                        ProgressView("Loading user info...")
                    }
                }

                // Comment Summary
                HStack {
                    Text("Comments").font(.headline)
                    Spacer()
                    Text("\(viewModel.commentCellViewModels.count)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // Comment List
                VStack(spacing: 8) {
                    ForEach(viewModel.commentCellViewModels) { cellVM in
                        CommentCellView(viewModel: cellVM)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
