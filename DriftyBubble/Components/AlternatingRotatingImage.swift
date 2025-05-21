//
//  AlternatingRotatingImage.swift
//  Drifty Bubble Button
//
//  Created by Macbook Pro  M'ed on 20/05/25.
//


import SwiftUI

struct AlternatingRotatingImage: View {
    @State private var angle: Angle = .zero
    @State private var isClockwise = true

    let imageName: String
    let rotationDuration: Double = 4.0
    let pauseDuration: Double = 0.25

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
            .rotationEffect(angle)
            .onAppear {
                startAlternatingRotation()
            }
    }

    func startAlternatingRotation() {
        let rotationAmount: Double = Double(360 * Int.random(in: 1...3))
        withAnimation(.easeInOut(duration: rotationDuration)) {
            angle += .degrees(isClockwise ? rotationAmount : -rotationAmount)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + rotationDuration + pauseDuration) {
            isClockwise.toggle()
            startAlternatingRotation()
        }
    }
}
