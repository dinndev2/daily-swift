//
//  ContentView.swift
//  theme
//
//  Created by MAC on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var systemTheme
    enum Theme {
        case light
        case dark
        case system
    }
    @State private var currentTheme: Theme = .system
    
    var body: some View {
        VStack {
            HStack {
                Button("Light") {
                    withAnimation(.easeInOut(duration: 0.3)){
                        currentTheme = .light
                    }
                }
                Button("Dark") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentTheme = .dark
                    }
                }
                Button("System") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        if systemTheme == .dark {
                            currentTheme = .dark
                        } else {
                            currentTheme = .light
                        }
                    }
                }
            }.background()

        }
        .padding(100)
        .background(currentTheme == .light ? Color.white : Color.black )
    }
}

#Preview {
    ContentView()
}
