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
    
    @State private var timer: Timer?
    
    @State private var isPlaying = true
    
 
    
    @State private var speed = 200.0
    @State private var showDesingSelectionView = true
    
    var body: some View {
        ZStack {
            BackGroundView()
            
            VStack{
                TitleView()
           
              
                Spacer()
                
                
                //TODO:
                BoardView(
                    board: $board,
                    selectedDesign: $selectedDesign,
                    swapXY: $swapXY,
                    currentImage: $currentImage,
                    showImage: $showImage
                )
               
                
                Spacer()
                
                if showDesingSelectionView {
                    DesignSelectionView(selectedDesign: $selectedDesign, swapXY: $swapXY)
                }
                
               
                
                ControlView(
                    showImage: $showImage,
                    currentImage: $currentImage,
                    speed: $speed, isPlaying: $isPlaying,
                    showDesignSelectionView: $showDesingSelectionView, board: $board
                )
               
            }
            .padding()
        }
        .onAppear {
            startGame()
        }
        .onChange(of: speed) { _, _ in
            resetSpeed()
        }
       
    }
    func startGame() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1 / speed,  repeats: true, block: { _ in
            withAnimation {
               
                if isPlaying {
                    board.nextGeneration()
                }
            }
        })
    }
    func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    func resetSpeed() {
        stopGame()
        startGame()
    }
    
    func resetGame() {
        board.clearBoard()
        stopGame()
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


