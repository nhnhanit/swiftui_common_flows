//
//  AppState.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 28/3/25.
//

import SwiftUI

final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func checkLoginStatus() {
        // Giả lập kiểm tra đăng nhập, có thể thay thế bằng UserDefaults / Keychain
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
    }
    
    func login() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        isLoggedIn = true
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        isLoggedIn = false
    }
}
