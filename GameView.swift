//
//  GameView.swift
//  Square Game
//
//  Created by cobsccomp242p-013 on 2026-01-17.
//
import SwiftUI

struct GameView: View {
    
    let level: GameLevel
    
    @State private var tiles: [Tile] = []
    @State private var selectedTiles: [Int] = []
    @State private var score = 0
    @State private var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var timeRemaining = 0
    @State private var timer: Timer?
    @State private var showWinPopup = false
    @State private var confetti = false
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        ZStack {
            GameBackground()
            
            VStack(spacing: 20) {
                
                // Score Card
                HStack {
                    ScoreCard(title: "Score", value: score)
                    ScoreCard(title: "Time", value: timeRemaining)
                    ScoreCard(title: "High", value: highScore)
                }
                .padding(.horizontal)
                
                // Game Grid
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(tiles.indices, id: \.self) { index in
                        TileView(tile: tiles[index])
                            .onTapGesture {
                                tileTapped(index)
                            }
                    }
                }
                .padding()
                
                Spacer()
            }
            if confetti {
                    ConfettiView()
                }
                
                if showWinPopup {
                    WinPopupView(
                        score: score,
                        timeBonus: timeRemaining * 2
                    ) {
                        showWinPopup = false
                        confetti = false
                        startGame()
                    }
                }
        }
        .navigationTitle("Color Match")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            startGame()
        }
    }

    
    func startGame() {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan]
        let selected = colors.prefix(level.pairCount)
        
        tiles = selected.flatMap { [Tile(color: $0), Tile(color: $0)] }
        tiles.shuffle()
        
        score = 0
        selectedTiles = []
        
        timeRemaining = level.timeLimit
        startTimer()
    }
    
    func tileTapped(_ index: Int) {
        guard !tiles[index].isFlipped,
              selectedTiles.count < 2 else { return }
        
        tiles[index].isFlipped = true
        selectedTiles.append(index)
        
        if selectedTiles.count == 2 {
            checkMatch()
        }
    }
    
    func checkMatch() {
        let first = selectedTiles[0]
        let second = selectedTiles[1]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if tiles[first].color == tiles[second].color {
                withAnimation(.spring()) {
                    tiles[first].isMatched = true
                    tiles[second].isMatched = true
                }
                
                score += 10
                checkWin()
                
                if score > highScore {
                    highScore = score
                    UserDefaults.standard.set(highScore, forKey: "HighScore")
                }
            }
            else {
                tiles[first].isFlipped = false
                tiles[second].isFlipped = false
            }
            selectedTiles.removeAll()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
            }
        }
    }

    func checkWin() {
        if tiles.allSatisfy({ $0.isMatched }) {
            timer?.invalidate()
            
            let bonus = timeRemaining * 2
            score += bonus
            
            if score > highScore {
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "HighScore")
            }
            
            withAnimation {
                showWinPopup = true
                confetti = true
            }
        }
    }

}

