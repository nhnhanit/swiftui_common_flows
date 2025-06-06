//
//  MockPostCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 29/4/25.
//

@testable import SwiftUI_0325

final class MockPostCoordinator: PostCoordinator {
    var navigatedToPostId: Int?
    var passedViewModel: PostDetailViewModel?

    func goToPostDetail(postId: Int, detailVM: PostDetailViewModel) {
        navigatedToPostId = postId
        passedViewModel = detailVM
    }
}
