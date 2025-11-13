//
//  ContentView.swift
//  flash_card
//
//  Created by MAC on 13/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isFlipped = false
    @State private var currentIndex = 0
    var vowels = ["あ": "a", "い": "i", "え": "e", "お": "o"]
    
    var body: some View {
        var pair: [(key: String, value: String)] {
                vowels.sorted { $0.key < $1.key } // ✅ sorted in order
            }
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                if pair.indices.contains(currentIndex) {
                    Button(action: {isFlipped.toggle()}) {
                        if isFlipped {
                            Text(pair[currentIndex].value)
                                .font(.largeTitle)
                        } else {
                            Text(pair[currentIndex].key)
                                .font(.largeTitle)
                        }
                    }.padding(10)
                }
                Text("Flip to reveal answer")
            }
        }.padding(100)
        HStack(spacing: 40) {
            Button("Prev") {
                if currentIndex > 0  {
                    currentIndex -= 1
                    isFlipped = false
                }
            }.disabled(currentIndex == 0)
            Button("Next") {
                if currentIndex < pair.count - 1 {
                    currentIndex += 1
                    isFlipped = false
                }
            }.disabled(currentIndex == pair.count - 1)
        }.padding(50)
    }
}


#Preview {
    ContentView()
}

