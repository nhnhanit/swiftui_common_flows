//
//  MockAppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//

import SwiftUI
@testable import SwiftUI_0325

final class MockAppCoordinator: Navigatable, AlertPresentable {
    var alertManager = SwiftUI_0325.GlobalAlertManager()
    var lastNavigatedRoute: AppRoute?
    
    func push(to route: SwiftUI_0325.AppRoute) {
        lastNavigatedRoute = route
    }
    
    func resetAndPush(to route: SwiftUI_0325.AppRoute) {
        lastNavigatedRoute = route
    }
}
