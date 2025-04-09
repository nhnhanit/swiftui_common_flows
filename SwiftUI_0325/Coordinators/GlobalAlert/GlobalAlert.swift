//
//  GlobalAlert.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//


// GlobalAlert.swift
import SwiftUI

struct GlobalAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: String?
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button?
}
