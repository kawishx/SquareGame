//
//  LevelButton.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct LevelButton: View {
    let title: String
    let color: Color
    
    var body: some View {
        NavigationLink {
            GameView(level:
                title == "Easy" ? .easy :
                title == "Medium" ? .medium : .hard)
        } label: {
            Text(title)
                .font(.title3)
                .frame(width: 220, height: 55)
                .background(color.gradient)
                .foregroundColor(.white)
                .cornerRadius(16)
                .shadow(radius: 10)
        }
    }
}

