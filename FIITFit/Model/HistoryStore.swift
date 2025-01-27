//
//  HistoryStore.swift
//  FIITFit
//
//  Created by Student on 1/26/25.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
