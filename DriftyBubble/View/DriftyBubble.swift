    //
    //  DriftyBubble.swift
    //  Drifty Bubble Button
    //
    //  Created by Macbook Pro  M'ed on 20/05/25.
    //

import SwiftUI

struct DriftyBubble: View {
    @State private var dragAmount: CGPoint?
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    
                    ChatButton()
                        .frame(width: 50, height: 50)
                        .padding(0)
                        .position(dragAmount ?? CGPoint(x: geometry.size.width-40, y: geometry.size.height-100))
                        .gesture(
                            DragGesture()
                                .onChanged { self.dragAmount = $0.location }
                                .onEnded { value in
                                    var currentPostion = value.location
                                    
                                    if currentPostion.x > (geometry.size.width/2) {
                                        currentPostion.x = geometry.size.width-40
                                    } else {
                                        currentPostion.x =  16
                                    }
                                    
                                    withAnimation(.easeOut(duration: 0.25)) {
                                        dragAmount = currentPostion
                                    }
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
        DriftyBubble()
    }
}
