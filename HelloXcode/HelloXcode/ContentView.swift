//
//  ContentView.swift
//  HelloXcode
//
//  Created by Janindu Pramod on 2026-11-13.
//

import SwiftUI

struct ContentView: View {
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
            }
        }
    }
}

#Preview {
    ContentView()
}
