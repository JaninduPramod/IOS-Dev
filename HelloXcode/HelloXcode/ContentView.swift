//
//  ContentView.swift
//  HelloXcode
//
//  Created by Janindu Pramod on 2026-11-13.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var timeLeft = 10
    @State private var isPlaying = false
    @State private var isGameOver = false
    @AppStorage("highScore") private var highScore = 0

    let accent = Color(red: 0.6, green: 0.85, blue: 0.7)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if isGameOver {
                gameOverView
            } else {
                gameView
            }
        }
        .onReceive(timer) { _ in
            guard isPlaying else { return }
            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                endGame()
            }
        }
    }

    var gameView: some View {
        VStack(spacing: 30) {
            Text("Tap Frenzy")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)
                .padding(.top, 40)

            Spacer()

            Text("SCORE")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.gray)
            Text("\(score)")
                .font(.system(size: 80, weight: .black))
                .foregroundStyle(accent)

            ProgressView(value: Double(timeLeft), total: 10)
                .tint(accent)
                .padding(.horizontal, 40)

            Text(isPlaying ? "\(timeLeft)s" : "tap to start")
                .foregroundStyle(.gray)

            Spacer()

            Button(action: tap) {
                Text("TAP")
                    .font(.system(size: 50, weight: .black))
                    .foregroundStyle(.black)
                    .frame(width: 220, height: 220)
                    .background(accent, in: Circle())
            }

            Spacer()
        }
    }

    var gameOverView: some View {
        VStack(spacing: 30) {
            Text("Game Over!")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)

            Spacer()

            Text("FINAL SCORE")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.gray)
            Text("\(score)")
                .font(.system(size: 80, weight: .black))
                .foregroundStyle(accent)
            Text("Best: \(highScore)")
                .font(.title2.bold())
                .foregroundStyle(.white)

            Spacer()

            Button("Play Again", action: resetGame)
                .font(.title2.bold())
                .foregroundStyle(.black)
                .frame(width: 200, height: 60)
                .background(accent, in: Capsule())

            Spacer()
        }
    }

    func tap() {
        if isPlaying {
            score += 1
        } else {
            isPlaying = true
        }
    }

    func endGame() {
        isPlaying = false
        isGameOver = true
        highScore = max(highScore, score)
    }

    func resetGame() {
        score = 0
        timeLeft = 10
        isGameOver = false
    }
}

#Preview {
    ContentView()
}
