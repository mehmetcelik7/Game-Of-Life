//
//  TitleView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//

import SwiftUI


struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var gradientColor: [Color] {
        colorScheme == .light ? [.white,.pink,.red] : [.blue,.purple,.white]
    }
    
    var shadowColor: Color {
        colorScheme == .light ? .red.opacity(0.3) : .purple.opacity(0.5)
    }
    
    var body: some View {
        Text("Game of life!")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(LinearGradient(colors: gradientColor, startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(color: shadowColor, radius: 10,x: 0, y: 5)
    }
}

#Preview {
    TitleView()
}
