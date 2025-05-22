//
//  ContentView.swift
//  Drifty Bubble Button
//
//  Created by Macbook Pro  M'ed on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showToast = false
    @State private var toastMessage = ""

    var body: some View {
        ZStack {

            HStack{
                Spacer()

                VStack {
                    Spacer()

                    VStack {
                        Text("Drifty Bubble")
                            .font(.largeTitle)
                            .bold()

                        Text("🕹️ Drag it. Drop it. Love it.")
                            .multilineTextAlignment(.center)
                    }

                    Spacer()
                }

                Spacer()
            }
            .foregroundColor(Color.accentColor)

            // TODO: - Add the floating draggable button
            DriftyBubble {
                showFunnyToast()
            }

            VStack {
                Spacer()
                if showToast {
                    BubbleToastView(message: toastMessage)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut, value: showToast)
        }
        .background(Color("systemBackground"))
    }

    func showFunnyToast() {
        let messages = [
            "Wheee! 🎉 😄",
        ]
        toastMessage = messages.randomElement() ?? "Boop!"
        withAnimation {
            showToast = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showToast = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
