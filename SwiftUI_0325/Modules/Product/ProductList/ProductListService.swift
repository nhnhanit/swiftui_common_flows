//
//  ProductListService.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//

import Foundation

class ProductListService {
    static let shared = ProductListService()
    private init() {}
    
    private static let cache = NSCache<NSString, NSData>()

    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let cacheKey = "cachedProducts"
        
        // ✅ Check cache
        if let cachedData = ProductListService.cache.object(forKey: cacheKey as NSString) {
            do {
                let products = try JSONDecoder().decode([Product].self, from: cachedData as Data)
                print("✅ Returning cached data")
                DispatchQueue.main.async {
                    completion(.success(products))
                }
                return
            } catch {
                print("❌ Cache decoding failed, clearing cache:", error)
                ProductListService.cache.removeObject(forKey: cacheKey as NSString)
            }
        }

        DispatchQueue.global(qos: .userInitiated).async {
            sleep(UInt32(0.5)) // Simulate network delay

            let mockData = """
            [
                { "id": "1", "name": "iPhone 15", "price": 999.99, "imageURL": "https://picsum.photos/id/237/200/300"},
                { "id": "2", "name": "MacBook Pro", "price": 1999.99, "imageURL": "https://picsum.photos/id/238/200/300", "isLiked": true },
                { "id": "3", "name": "Apple Watch", "price": 399.99, "imageURL": "https://picsum.photos/id/239/200/300" }
            ]
            """.data(using: .utf8)!

            do {
                let products = try JSONDecoder().decode([Product].self, from: mockData)
                print("✅ Returning network data", products[0].description)
                DispatchQueue.main.async {
                    // ✅ Convert `Data` -> `NSData`
                    ProductListService.cache.setObject(mockData as NSData, forKey: cacheKey as NSString)
                    completion(.success(products))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

}

