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
    
    func push(to route: AppRoute) {
        lastNavigatedRoute = route
    }
    
    func resetAndPush(to route: AppRoute) {
        lastNavigatedRoute = route
    }
    
    func popToRoot() {
    }
}
