//
//  MockAppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

final class MockAppCoordinator: Navigatable {
    var lastNavigatedRoute: AppRoute?

    func navigate(to route: AppRoute) {
        lastNavigatedRoute = route
    }
}
