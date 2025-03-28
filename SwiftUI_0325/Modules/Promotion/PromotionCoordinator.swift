//
//  PromotionCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

final class PromotionCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    
    func start() {
        //
    }
        
//    func start() -> AnyView {
//        return AnyView(PromotionView(coordinator: self))
//    }

    func showPromotionDetail(promotionID: Int) {
        navigationPath.append(promotionID)
    }
}
