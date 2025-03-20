//
//  ControlView.swift
//  Game Of Life
//
//  Created by mehmet Çelik on 17.03.2025.
//

import SwiftUI

struct ControlView : View {
    
    @Binding var showImage: Bool
    @Binding var currentImage: ImageResource
    @Binding var speed: Double
    @Binding var isPlaying: Bool
    @Binding var showDesignSelectionView: Bool
    @Binding var board: BoardModel
    
    var body: some View {
        VStack {
            Slider(value: $speed, in: 1...300, step: 0.5)
            
            HStack {
                
                
                ButtonView(name: ControlButtonType.playPause(isPlaying: isPlaying).systemImage,action: {
                    isPlaying.toggle()
                })
                    
                ButtonView(name: ControlButtonType.refresh.systemImage, action: {board.randomBoard()})
                
                ButtonView(name: ControlButtonType.clear.systemImage, action: {board.clearBoard()})
                
                
                
                ButtonView(name: ControlButtonType.toggleImage.systemImage, action: {showImage.toggle()})
                
                
                ButtonView(name: ControlButtonType.changeImage.systemImage, action: {
                    withAnimation {
                        currentImage = BackgroundImages.all.randomElement() ?? .mountain1
                    }
                })
                
                ButtonView(name: ControlButtonType.toggleVisibility(isHidden: showDesignSelectionView).systemImage, action: {
                    withAnimation {
                        showDesignSelectionView.toggle()
                    }
                })
                
                
            }
        }
    }
}

enum ControlButtonType {
    case playPause(isPlaying : Bool)
    case refresh, clear, toggleImage, changeImage, toggleVisibility(isHidden: Bool)
    
    var systemImage: String {
        switch self {
            
        case .playPause(isPlaying: let isPlaying):
            isPlaying ? "pause" : "play"
        case .refresh:
            "arrow.counterclockwise"
        case .clear:
            "clear"
        case .toggleImage:
            "photo.on.rectangle"
        case .changeImage:
            "arrow.triangle.2.circlepath"
        case .toggleVisibility(isHidden: let isHidden):
            isHidden ? "ladybug" : "ladybug.slash"
        }
    }
    
    
}




struct ButtonView: View {
    let name: String
    let font: Font = Font.headline
    let color: Color = .white
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .font(font)
                .foregroundStyle(color)
                .padding(10)
                .background(Circle().fill(color.opacity(0.2)))
        }.frame(maxWidth: .infinity)

    }
}

#Preview {
    ZStack {
        
        Color.bg.ignoresSafeArea()
        ControlView(
            showImage: .constant(true),
            currentImage: .constant(.autumn1),
            speed: .constant(100.0), isPlaying: .constant(true),
            showDesignSelectionView: .constant(true), board: .constant(BoardModel(gridSize: 50))
        )
    }
    
}
