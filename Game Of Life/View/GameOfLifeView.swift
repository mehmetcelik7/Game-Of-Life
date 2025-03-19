//
//  ContentView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//
//

import SwiftUI



struct GameOfLifeView: View {
    
    @State private var board: BoardModel = BoardModel(gridSize: 50)
    @State private var selectedDesign: DesignType = .tub
    @State private var swapXY: Bool = false
    @State private var currentImage: ImageResource = .mountain1
    @State private var showImage: Bool = true
    var body: some View {
        ZStack {
            BackGroundView()
            
            VStack{
                TitleView()
           
              
                Spacer()
                
                
                //TODO:
                BoardView(
                    board: .constant(BoardModel(gridSize: 50)),
                    selectedDesign: .constant(.tub),
                    swapXY: .constant(false),
                    currentImage: .constant(.mountain1),
                    showImage: .constant(true)
                )
               
                
                Spacer()
                ControlView()
            }
            .padding()
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


