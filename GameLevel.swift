//
//  GameLevel.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
enum GameLevel {
    case easy, medium, hard
    
    var pairCount: Int {
        switch self {
        case .easy: return 4
        case .medium: return 6
        case .hard: return 8
        }
    }
    
    var timeLimit: Int {
        switch self {
        case .easy: return 60
        case .medium: return 45
        case .hard: return 30
        }
    }
}
