//
//  UserProfile.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    let id: String
    var name: String
    let email: String
}
