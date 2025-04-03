//
//  Product.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import SwiftUI

class Product: Identifiable, ObservableObject, Decodable {
    let id: String
    let name: String
    let price: Double
    let imageURL: String
    
    // Đánh dấu là @Published để SwiftUI có thể theo dõi thay đổi
    @Published var isLiked: Bool = false

    var description: String {
        return "Product(id: \(id), name: \(name), price: \(price), imageURL: \(imageURL), isLiked: \(isLiked))"
    }
    
    // Enum cho việc giải mã JSON
    enum CodingKeys: String, CodingKey {
        case id, name, price, imageURL, isLiked
    }

    // Hàm khởi tạo mặc định
    init(id: String, name: String, price: Double, imageURL: String, isLiked: Bool = false) {
        self.id = id
        self.name = name
        self.price = price
        self.imageURL = imageURL
        self.isLiked = isLiked
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Double.self, forKey: .price)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
    }

    // Hàm toggleLike
    func toggleLike() {
        isLiked.toggle()
    }
}
