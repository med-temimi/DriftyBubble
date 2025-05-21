//
//  ContentView.swift
//  Drifty Bubble Button
//
//  Created by Macbook Pro  M'ed on 20/05/25.
//

import SwiftUI

struct ContentView: View {
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


                //TODO: - Add the draggable floating button
                DriftyBubble()
        }
        .background(
            Color("systemBackground")
        
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
