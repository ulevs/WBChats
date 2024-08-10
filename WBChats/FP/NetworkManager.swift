//
//  NetworkManager.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.08.2024.
//

import Foundation
import SwiftUI

enum NetworkErrors: Error {
    case badResponse
    case failedToFormImage
    case urlFormFail
}

class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    private let baseURL = "https://cataas.com/cat"
    
    func getImage() async throws -> UIImage {
        guard let url = URL(string: baseURL) else {
            throw NetworkErrors.urlFormFail
        }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NetworkErrors.badResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw NetworkErrors.failedToFormImage
        }
        return image
    }
    // MARK: USAGE
    // Task *optional (priority: .medium) {
//      async let image = try getImage()
//    }
}

