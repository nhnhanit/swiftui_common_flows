//
//  Coordinator.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import SwiftUI

protocol Coordinator: ObservableObject {
    var navigationPath: NavigationPath { get set }
}
