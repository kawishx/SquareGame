//
//  ScoreCard.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct ScoreCard: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            
            Text("\(value)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.12))
                .blur(radius: 0.3)
        )
    }
}

