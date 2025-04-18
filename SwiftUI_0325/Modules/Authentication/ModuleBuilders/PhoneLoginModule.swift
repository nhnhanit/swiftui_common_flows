//
//  PhoneLoginModule.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 18/4/25.
//

final class PhoneLoginModule {
    static func build(coordinator: AuthenCoordinator, alertManager: GlobalAlertManager) -> PhoneLoginView {
        return PhoneLoginView(coordinator: coordinator, alertManager: alertManager)
    }
}
