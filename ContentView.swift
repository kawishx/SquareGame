//
//  ContentView.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                GameBackground()
                
                VStack(spacing: 40) {
                    
                    Text("🎨 Color Match")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
                    NavigationLink("Start Game") {
                        LevelSelectionView()
                    }
                    .font(.title3)
                    .padding()
                    .frame(width: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue.gradient)
                    )
                    .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
