//
//  WinPopupView.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-24.
//
import SwiftUI

struct WinPopupView: View {
    
    let score: Int
    let timeBonus: Int
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🎉 You Win!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Score: \(score)")
                .font(.title2)
            
            Text("Time Bonus: \(timeBonus)")
                .foregroundColor(.green)
            
            Button("Play Again") {
                onRestart()
            }
            .padding()
            .frame(width: 200)
            .background(Color.blue.gradient)
            .foregroundColor(.white)
            .cornerRadius(16)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(radius: 20)
        )
        .padding()
    }
}

