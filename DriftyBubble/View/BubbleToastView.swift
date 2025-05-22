//
//  BubbleToastView.swift
//  DriftyBubble
//
//  Created by Macbook Pro  M'ed on 22/05/25.
//

import SwiftUI

struct BubbleToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.75))
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .padding(.bottom, 80)
    }
}
