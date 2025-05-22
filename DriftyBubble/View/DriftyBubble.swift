    //
    //  DriftyBubble.swift
    //  Drifty Bubble Button
    //
    //  Created by Macbook Pro  M'ed on 20/05/25.
    //

import SwiftUI

struct DriftyBubble: View {
    @State private var dragAmount: CGPoint?
    var onTap: () -> Void

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Spacer()

                        //TODO: - You want to use Lottie animations !, then code below is yours
                        //                    Circle()
                        //                .frame(width: 80, height: 80)
                        //                .foregroundColor(.clear)
                        //                .shadow(radius: 3)
                        //                .overlay {
                        //                    LottieView(animation: .named("chatbot"))
                        //                        .playing(loopMode: .loop)
                        //                        .frame(width: 80, height: 80)
                        //
                        //                }

                    AlternatingRotatingImage(imageName: "floatingIcon")
                        .frame(width: 50, height: 50)
                        .padding(0)
                        .position(dragAmount ?? CGPoint(x: geometry.size.width - 45, y: geometry.size.height - 100))
                        .highPriorityGesture(
                            DragGesture()
                                .onChanged { self.dragAmount = $0.location }
                                .onEnded { value in
                                    var currentPostion = value.location

                                    if currentPostion.x > (geometry.size.width / 2) {
                                        currentPostion.x = geometry.size.width - 45
                                    } else {
                                        currentPostion.x = 16
                                    }

                                    withAnimation(.easeOut(duration: 0.25)) {
                                        dragAmount = currentPostion
                                    }
                                }
                        )
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded {
                                    onTap()
                                }
                        )
                }
            }
        }
        .padding(0)
    }
}


struct DriftyBubble_Previews: PreviewProvider {
    static var previews: some View {
        DriftyBubble(onTap: {})
    }
}
