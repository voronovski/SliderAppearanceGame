//
//  ContentView.swift
//  SliderAppearanceGame
//
//  Created by Aleksei Voronovskii on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Move slider closer to: \(targetValue)")
            HStack {
                Text("0")
                CustomSliderView(
                    value: $currentValue,
                    alpha: computeScore()
                )
                Text("100")
            }
            
            Button("Check") {
                showingAlert.toggle()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your Score"),
                      message: Text(computeScore().formatted()),
                      dismissButton: .default(Text("OK")))
            }
            
            Button("Start over") {
                targetValue = Int.random(in: 0...100)
                currentValue = Double.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
