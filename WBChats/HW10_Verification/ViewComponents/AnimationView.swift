//
//  AnimationView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 29.07.2024.
//


import SwiftUI

struct BallAnimation: View {

    @State var y: CGFloat = 0
    @State private var scaleX: CGFloat = 1.1
    @State private var scaleY: CGFloat = 0.9
    var body: some View {
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
//
//import SwiftUI
//
//struct CrazyCatAnimation: View {
//
//    @State var y: CGFloat = 0
//    @State var x: CGFloat = 0
//    @State private var scaleX: CGFloat = 1.1
//    @State private var scaleY: CGFloat = 0.9
//    var body: some View {
//        Text("🐈")
//            .onAppear {
//                withAnimation(
////                    .easeInOut(duration: 0.6)
//                    .smooth(duration: 0.9, extraBounce: 0.9)
////                    .linear(duration: 0.4)
////                    .bouncy(duration: 0.1, extraBounce: 0.001)
////                    .interpolatingSpring(mass: 10, stiffness: 2000, damping: 10)
//                    .repeatForever()
//                ) {
//
//                    switch y {
//                    case 0:
//                        scaleX = 9.8
//                        scaleY = 9.2
//                        y = -90
//                        x = -30
//                        
//                
//                    default:
//                        scaleX = 1.2
//                        scaleY = 0.8
//                        y = 0
//                        x = 20
//                    }
//                }
//            }
//            .padding()
//            .offset( x: x, y: y)
//            .scaleEffect(x: scaleX, y: scaleY)
//            .rotationEffect(.zero)
//        
//    }
//}

#Preview {
    BallAnimation()
}
