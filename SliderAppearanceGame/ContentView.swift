//
//  ContentView.swift
//  SliderAppearanceGame
//
//  Created by Aleksei Voronovskii on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Double.random(in: 0...100).rounded()
    @State private var currentValue = Double.random(in: 0...100).rounded()
    @State private var showingAlert = false
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Move slider closer to: \(targetValue.formatted())")
            Slider(value: $currentValue, in: 0...100, step: 1)
                .accentColor(
                    Color
                        .blue
                        .opacity(Double(100 - abs(currentValue - targetValue))/100)
                )
            Button("Check") {
                score = computeScore()
                showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your Score"),
                      message: Text("\(score)"),
                      dismissButton: .default(Text("OK")))
            }
            
            Button("Start over") {
                startOver()
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return lround(100 - difference)
    }
    
    private func startOver() {
        targetValue = Double.random(in: 0...100).rounded()
        currentValue = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
