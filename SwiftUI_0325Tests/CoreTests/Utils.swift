//
//  Utils.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 8/5/25.
//

// MARK: - Helpers

func waitForCompletion(seconds: Double) async {
    try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
}
