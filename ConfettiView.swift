//
//  ConfettiView.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-24.
//
import SwiftUI

struct ConfettiView: View {
    @State private var yOffset: CGFloat = -200
    
    var body: some View {
        ForEach(0..<25, id: \.self) { _ in
            Circle()
                .fill(Color.random)
                .frame(width: 8, height: 8)
                .position(
                    x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                    y: yOffset
                )
                .onAppear {
                    withAnimation(.linear(duration: Double.random(in: 2...4))) {
                        yOffset = UIScreen.main.bounds.height + 200
                    }
                    
                }
            
        }
    }
}

