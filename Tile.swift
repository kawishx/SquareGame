//
//  Tile.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct Tile: Identifiable {
    let id = UUID()
    let color: Color
    var isFlipped = false
    var isMatched = false
}

