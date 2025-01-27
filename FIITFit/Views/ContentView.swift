//
//  ContentView.swift
//  FIITFit
//
//  Created by Student on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 9
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab) // 1
                .tag(9) // 2
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index) // 3
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
