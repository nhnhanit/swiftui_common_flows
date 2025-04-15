//
//  JSONTestLoader.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 14/4/25.
//


import Foundation

enum JSONTestLoader {
    /// Load và decode file JSON từ bundle test
    static func load<T: Decodable>(_ fileName: String, as type: T.Type = T.self) throws -> T {
        let bundle = Bundle(for: DummyTestClass.self) // Nếu dùng SwiftPM
        // Nếu dùng Xcode project thì thay bằng:
        // let bundle = Bundle(for: DummyTestClass.self)

        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("❌ Không tìm thấy file \(fileName).json")
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

// Nếu không dùng SwiftPM:
final class DummyTestClass {}
