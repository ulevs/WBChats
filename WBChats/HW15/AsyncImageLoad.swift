//
//  asyncImageLoad.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 13.08.2024.
//
//
import Foundation
import SwiftUI
import Combine

class AsyncImageLoad: ObservableObject {
    @Published var image: UIImage?
    
    private var imageRequest: AnyCancellable?
    private var imageRequests = Set<AnyCancellable>()

    func loadImage(from url: URL) {
        imageRequest = URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Не удалось загрузить изображение. Ошибка: \(error)")
                }
            }, receiveValue: { [weak self] image in
                self?.image = image
            })
    }

    deinit {
        imageRequest?.cancel()
        imageRequests.forEach { $0.cancel() }
    }
}
