//
//  ImageLoader.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 26/3/25.
//


import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private static let cache = NSCache<NSString, UIImage>()

    func loadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        
        // ✅ Check if image is already cached
        if let cachedImage = ImageLoader.cache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }

        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let loadedImage = UIImage(data: data) {
                // Save image to cache
                ImageLoader.cache.setObject(loadedImage, forKey: cacheKey)
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            } else {
                self.image = UIImage()
            }
        }
    }
}
