//
//  GlobalAlert.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/4/25.
//

import SwiftUI

struct GlobalAlert: Identifiable {
    var id = UUID()
    let title: String
    let message: String?
    let primaryText: String
    let secondaryText: String?
    let onPrimary: () -> Void
    let onSecondary: (() -> Void)?
}
