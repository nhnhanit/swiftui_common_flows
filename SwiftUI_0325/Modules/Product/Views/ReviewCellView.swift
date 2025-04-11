//
//  ReviewCellView.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 11/4/25.
//

import SwiftUI

struct ReviewCellView: View {
    let viewModel: ReviewCellViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.userName).bold()
            Text(viewModel.description)
        }
    }
}
