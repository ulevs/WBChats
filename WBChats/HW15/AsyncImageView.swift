//
//  AsyncImageView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 13.08.2024.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL?
    let placeholder: Image
    
    var body: some View {
        if let url = url {
            ZStack {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    placeholder
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            loader.loadImage(from: url)
                        }
                }
            }
        } else {
            placeholder
                .resizable()
                .scaledToFit()
        }
    }
}

