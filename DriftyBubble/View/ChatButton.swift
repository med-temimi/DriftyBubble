//
//  ChatButton.swift
//  Drifty Bubble Button
//
//  Created by Macbook Pro  M'ed on 20/05/25.
//

import SwiftUI
import Lottie

struct ChatButton: View {

    @State var opacityState: Double = 1

    var body: some View {
        Button {
        } label: {
            
            AlternatingRotatingImage(imageName: "floatingIcon")

//            Circle()
//                .frame(width: 80, height: 80)
//                .foregroundColor(.clear)
//                .shadow(radius: 3)
//                .overlay {
//                    LottieView(animation: .named("chatbot"))
//                        .playing(loopMode: .loop)
//                        .frame(width: 80, height: 80)
//
//                }
        }
        .disabled(true)
        .opacity(opacityState)
        .onLongPressGesture(minimumDuration: 0.2) {
            print("press")
            withAnimation(.linear(duration: 0.1)) {
                opacityState = 0.2
            }
            withAnimation(.linear(duration: 0.1).delay(0.1)) {
                opacityState = 1
            }
        }
    }
}

struct ChatButton_Previews: PreviewProvider {
    static var previews: some View {
        ChatButton()
    }
}
