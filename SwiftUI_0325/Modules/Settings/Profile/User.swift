//
//  User.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 2/4/25.
//


import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    let email: String
}
