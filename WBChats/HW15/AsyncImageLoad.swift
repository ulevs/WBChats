//
//  asyncImageLoad.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 13.08.2024.
//
//
//import Foundation
//import SwiftUI
//import Combine
//
////class ImageLoader: ObservableObject {
////    @Published var image: UIImage?
////    
////    private var cancellable: AnyCancellable?
////    
////    func loadImage(from url: URL) {
////        cancellable = URLSession.shared.dataTaskPublisher(for: url)
////            .map { UIImage(data: $0.data) }
////            .replaceError(with: nil)
////            .receive(on: DispatchQueue.main)
////            .assign(to: \.image, on: self)
////    }
////    
////    deinit {
////        cancellable?.cancel()
////    }
////}
//
//
//class ImageLoader: ObservableObject {
//    @Published var image: UIImage? = nil
//    
//    private var cancellable: AnyCancellable?
//    
//    func loadImage(from url: URL) {
//        print("Start loading image from URL: \(url)") // Логирование URL
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { data, response -> UIImage? in
//                if let httpResponse = response as? HTTPURLResponse {
//                    print("HTTP Status Code: \(httpResponse.statusCode)") // Логирование статуса ответа
//                }
//                return UIImage(data: data)
//            }
//            .replaceError(with: nil)
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.image, on: self)
//    }
//    
//    deinit {
//        cancellable?.cancel()
//    }
//}

import SwiftUI
import UIKit

// ImageLoader для загрузки и кэширования изображений
class ImageLoader: ObservableObject {
    @Published var imageCache: [String: UIImage] = [:] // Кэш изображений
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache[url] {
            completion(cachedImage)
            return
        }
        
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: imageURL)
                if let loadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageCache[url] = loadedImage
                        completion(loadedImage)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to load image: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
}

// Модель ответа для получения случайного изображения собаки
struct DogImageResponse: Decodable {
    let url: String
}
