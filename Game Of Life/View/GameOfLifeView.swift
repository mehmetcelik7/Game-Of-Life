//
//  ContentView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//
//

import SwiftUI



struct GameOfLifeView: View {
    var body: some View {
        ZStack {
            BackGroundView()
            
            VStack{
                TitleView()
                Spacer()
                BoardView()
                Spacer()
                ControlView()
            }
        }
       
    }
}




#Preview("Light Mode") {
    GameOfLifeView()
        .preferredColorScheme(.light)
}


#Preview("Dark Mode") {
    GameOfLifeView()
        .preferredColorScheme(.dark)
}


