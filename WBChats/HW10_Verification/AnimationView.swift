//
//  AnimationView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 29.07.2024.
//


import SwiftUI

 struct BallAnimation: View {

    @State private var y: CGFloat = 0
    @State private var scaleX: CGFloat = 1.1
    @State private var scaleY: CGFloat = 0.9
    
    public var body: some View {
        Text("🟣")
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.6)
                    .repeatForever()
                ) {

                    switch y {
                    case 0:
                        scaleX = 0.8
                        scaleY = 1.2
                        y = -90
                    default:
                        scaleX = 1.2
                        scaleY = 0.8
                        y = 0
                    }
                }
            }
            .padding()
            .offset(y: y)
            .scaleEffect(x: scaleX, y: scaleY)
            .opacity(0.5)

    }
}


#Preview {
    BallAnimation()
}
