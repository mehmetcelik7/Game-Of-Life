//
//  BoardModel.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//

import Foundation

struct BoardModel {
    var gridSize: Int
    var creatures: [[Int]] = []
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.randomBoard()
    }
    
    mutating func randomBoard() {
        creatures = []
        
        for _ in 0..<gridSize {
            creatures
                .append(
                    Array(repeating: 0, count: gridSize)
                        .map{ _ in
                            Int.random(in: 0...1)
                        }
                )
        }
    }
    
    
    mutating func clearBoard() {
        creatures = Array(repeating: Array(repeating: 0, count: gridSize), count: gridSize)
    }
    
    func countLiveNeighbours(row: Int, col: Int) -> Int {
        let directions: [(x:Int,y:Int)] = [(-1,-1),(0,-1),(1,-1),(-1,0),(1,0),(-1,1),(0,1),(1,1)]
        var count = 0
        
        for direction in directions {
            let newRow = (row + direction.x + gridSize) % gridSize
            let newCol = (col + direction.y + gridSize) % gridSize
            count += self.creatures[newRow][newCol]
        }
        
        
        return count
    }
    
    
    mutating func safelyAssingCreatureState(i:Int, j:Int, state:Int) {
        let safeRow = (i + gridSize) % gridSize
        let safeCol = (j + gridSize) % gridSize
        self.creatures[safeRow][safeCol] = state
    }
    
    mutating func applyDesignPattern(row: Int, col: Int , designType: DesignType, swapXY: Bool) {
        if self.creatures[row][col] == 0 {
            for offset in designType.offsetDesing {
                let dx = swapXY ?  offset.x : offset.y
                let dy = swapXY ? offset.y : offset.x
                
                safelyAssingCreatureState(i: row + dx, j: col + dy, state: 1)
            }
        }
    }
}

