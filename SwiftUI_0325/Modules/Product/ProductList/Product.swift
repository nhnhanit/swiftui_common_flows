//
//  Product.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import Foundation

struct Product: Identifiable, Decodable, Hashable {
    let id: String
    let name: String
    let price: Double
    let imageURL: String
    var isLiked: Bool = false

    // ✅ Custom decoding để bỏ qua `isLiked` nếu không có trong JSON
    enum CodingKeys: String, CodingKey {
        case id, name, price, imageURL, isLiked
    }

    // Constructor (hàm khởi tạo) mặc định
    init(id: String, name: String, price: Double, imageURL: String, isLiked: Bool = false) {
        self.id = id
        self.name = name
        self.price = price
        self.imageURL = imageURL
        self.isLiked = isLiked
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Double.self, forKey: .price)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
    }

    // ✅ Nếu bạn cần `Encodable`, bạn có thể thêm:
    // func encode(to encoder: Encoder) throws { ... }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    mutating func toggleLike() {
        isLiked.toggle()
    }
}

