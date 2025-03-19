//
//  TitleView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//

import SwiftUI


struct TitleView: View {
    
    
    var gradientColor: [Color] {
       [.gradColor1,.gradColor2,.gradColor3] 
    }
    
   
    
    var body: some View {
        Text("Game of life!")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(LinearGradient(colors: gradientColor, startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(color: .shadow, radius: 10,x: 0, y: 5)
       
    }
}

#Preview {
    TitleView()
}
