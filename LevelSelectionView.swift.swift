//
//  LevelSelectionView.swift.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct LevelSelectionView: View {
    
    var body: some View {
        ZStack {
            GameBackground()
            
            VStack(spacing: 25) {
                Text("Choose Level")
                    .font(.title)
                    .foregroundColor(.white)
                
                LevelButton(title: "Easy", color: .green)
                LevelButton(title: "Medium", color: .orange)
                LevelButton(title: "Hard", color: .red)
            }
        }
    }
}
