//
//  MockAppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 5/5/25.
//

import SwiftUI

final class MockAppCoordinator: Navigatable {
    var lastNavigatedRoute: AppRoute?
    
    func push(to route: SwiftUI_0325.AppRoute) {
        lastNavigatedRoute = route
    }
    
    func resetAndPush(to route: SwiftUI_0325.AppRoute) {
        lastNavigatedRoute = route
    }
    
    func popToRoot() {
        //
    }
}
