//
//  CatsAPI.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.08.2024.
//

import SwiftUI

//struct ContentView: View {
//    @State private var image: UIImage?
//    @State private var error: Error?
//    
//    var body: some View {
//        VStack {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//            } else if let error = error {
//                Text("Error loading image: \(error.localizedDescription)")
//            } else {
//                ProgressView("Loading image...")
//                    .onAppear {
//                        loadImage()
//                    }
//            }
//        }
//        .padding()
//    }
//    
//    func loadImage() {
//        Task {
//            do {
//                let fetchedImage = try await NetworkManager.shared.getImage()
//                image = fetchedImage
//            } catch {
//                self.error = error
//            }
//        }
//    }
//}
//




struct ContentView: View {
    @State private var image: UIImage?
    @State private var error: Error?
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else if let error = error {
                Text("Error loading image: \(error.localizedDescription)")
            } else {
                ProgressView("Loading image...")
                    .onAppear {
                        loadImage()
                    }
            }
        }
        .padding()
    }
    
    func loadImage() {
        Task {
            do {
                let imageURL = try await NetworkManager.shared.getImageURL()
                
                // Загрузка изображения по URL
                let imageData = try Data(contentsOf: imageURL)
                if let uiImage = UIImage(data: imageData) {
                    self.image = uiImage
                } else {
                    throw NetworkErrors.failedToSaveImage
                }
            } catch {
                self.error = error
            }
        }
    }
}
