//
//  BoardView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//
import SwiftUI

struct BoardView: View {
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .aspectRatio(1,contentMode: .fit)
            .padding(.horizontal)
            .overlay {
                Text("Board View")
                    .foregroundStyle(.white)
                    .bold()
            }
    }
}

#Preview {
    BoardView()
}
