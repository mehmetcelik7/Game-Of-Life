//
//  BoardView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//
import SwiftUI

struct BoardView: View {
    
    let gridSize = 50
    let color: Color = .red
    
    @Binding var board: BoardModel
    @Binding var selectedDesign: DesignType
    @Binding var swapXY: Bool
    @Binding var currentImage: ImageResource
    @Binding var showImage: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let canvasSize = min(
                geometry.size.width,
                geometry.size.height
            )
            let cellSize = canvasSize / CGFloat(gridSize)
            ZStack {
                CreatureGrid(
                    creatures: $board.creatures,
                    gridSize: gridSize,
                    color: color
                )
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                }
                .frame(width: canvasSize,height: canvasSize)
                .frame(maxHeight: .infinity)
                .shadow(radius: 3)
            }
        }
    }
}

#Preview {
    BoardView(
        board: .constant(BoardModel(gridSize: 50)),
        selectedDesign: .constant(.tub),
        swapXY: .constant(false),
        currentImage: .constant(.mountain1),
        showImage: .constant(true)
    )
    .padding()
}
