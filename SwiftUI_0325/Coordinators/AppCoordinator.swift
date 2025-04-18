//
//  AppCoordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//
//

import SwiftUI
import Combine

protocol Navigatable: AnyObject {
    func push(to route: AppRoute)
    func resetAndPush(to route: AppRoute)
}

final class AppCoordinator: ObservableObject, Navigatable {
    
    @Published var path = NavigationPath()
    private var cancellables = Set<AnyCancellable>()
        
    init() {
        observeSession()
    }
    
    private func observeSession() {
        SessionManager.shared.$isLoggedIn
            .dropFirst() // ignore the fist emit when init
            .sink { [weak self] isLoggedIn in
                guard let self else { return }
                if isLoggedIn {
                    self.resetAndPush(to: .main)
                } else {
                    self.popToRoot()
                }
            }
            .store(in: &cancellables)
    }
    
    func push(to route: AppRoute) {
        path.append(route)
    }
    
    func resetAndPush(to route: AppRoute) {
        path = NavigationPath()
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

enum AppRoute: Hashable {
//    case login
    case phoneLogin
    case OTPVerify
    case authenRoute(AuthenRoute)
    case main
    case productRoute(ProductRoute)
    case settingsRoute(SettingsRoute)
}

