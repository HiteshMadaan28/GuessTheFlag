//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hitesh Madaan on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // .leading and .trailing for left and right alignment of view
        // Same with HStack
        // Spacer() is like a spring take all the space and push other view to one corner
        ZStack{
            //Color.primary used for text to automaticaly convert from white to black when the darkmode is on
            // Shift+command+A for switching between dark and light mode
            Color.mint
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                .ignoresSafeArea()
            Text("This is the Text below")
                .foregroundStyle(.secondary)
                .font(.largeTitle)
                .padding(20)
                .background(.ultraThinMaterial)
                
                
            
        }
    }
}

#Preview {
    ContentView()
}
