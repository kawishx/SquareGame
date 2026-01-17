//
//  GameBackground.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct GameBackground: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color.black,
                Color(red: 0.1, green: 0.1, blue: 0.2)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

