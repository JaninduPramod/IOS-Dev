//
//  ContentView.swift
//  HelloXcode
//
//  Created by Janindu Pramod on 2026-11-13.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0

    let accent = Color(red: 0.6, green: 0.85, blue: 0.7)

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

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

                Spacer()

                Button {
                    score += 1
                } label: {
                    Text("TAP")
                        .font(.system(size: 50, weight: .black))
                        .foregroundStyle(.black)
                        .frame(width: 220, height: 220)
                        .background(accent, in: Circle())
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
