//
//  UserInfo.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 22/4/25.
//

import Foundation

struct UserInfo: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
}
