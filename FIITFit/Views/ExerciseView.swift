//
//  ExerciseView.swift
//  FIITFit
//
//  Created by Student on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showSuccess = false
    
    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    let interval: TimeInterval = 30
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") { }
    }
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
        .sheet(isPresented: $showSuccess) {
            SuccessView(selectedTab: $selectedTab)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Header View
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: Exercise.exercises[index].exerciseName
                )
                    .padding(.bottom)
                
                // Video
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                // Timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                
                // Start/Done Button
                HStack(spacing: 150) {
                    startButton
                    doneButton
                }
                    .font(.title3)
                    .padding()
                
                // Rating
                RatingView(rating: $rating)
                    .padding()
                
                // History Button
                Spacer()
                Button("History") { }
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
}
