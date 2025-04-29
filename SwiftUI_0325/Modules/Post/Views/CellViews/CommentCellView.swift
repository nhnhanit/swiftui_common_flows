//
//  CommentCellView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct CommentCellView: View {
    let viewModel: CommentCellViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name).bold()
            Text(viewModel.body)
        }
    }
}
