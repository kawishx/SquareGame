//
//  TileView.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct TileView: View {
    
    let tile: Tile
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    tile.isFlipped || tile.isMatched
                    ? LinearGradient(colors: [tile.color, tile.color.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    : LinearGradient(colors: [Color.white.opacity(0.12), Color.white.opacity(0.06)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .shadow(color: tile.isFlipped ? tile.color.opacity(0.6) : .clear,
                        radius: 10)
            
            if tile.isMatched {
                Image(systemName: "checkmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(height: 85)
        .rotation3DEffect(
            .degrees(tile.isFlipped ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.spring(response: 0.4, dampingFraction: 0.7),
                   value: tile.isFlipped)
    }
}


