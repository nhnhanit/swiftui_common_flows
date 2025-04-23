//
//  MockProductCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 16/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

//final class MockProductCoordinator: ProductCoordinator {
//    var didShowError = false
//    var lastErrorTitle: String?
//    var lastErrorMessage: String?
//
//    override func showErrorAlert(title: String, message: String) {
//        didShowError = true
//        lastErrorTitle = title
//        lastErrorMessage = message
//    }
//}
final class MockProductCoordinator: ProductCoordinator {
    var navigatedToPostId: Int?
    
}
