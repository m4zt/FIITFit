//
//  HistoryView.swift
//  FIITFit
//
//  Created by Student on 2/6/25.
//

import SwiftUI
import Charts

struct BarChartWeekView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var weekData: [ExerciseDay] = []

    var body: some View {
        Chart(weekData) { day in
            ForEach(Exercise.names, id: \.self) { name in
                BarMark(
                    x: .value("Date", day.date, unit: .day),
                    y: .value("Total Count", day.countExercise(exercise: name)))
                .foregroundStyle(by: .value("Exercise", name))
            }
    }
    .chartForegroundStyleScale([
        "Burpee": Color("chart-burpee"),
        "Squat": Color("chart-squat"),
        "Step Up": Color("chart-step-up"),
        "Sun Salute": Color("chart-sun-salute")
    ])
    .padding()
    .onAppear {
        let firstDate = history.exerciseDays.first?.date ?? Date()
        let dates = firstDate.previousSevenDays
        weekData = dates.map { date in
            // swiftlint:disable:next trailing_closure
            history.exerciseDays.first(
                where: { $0.date.isSameDay(as: date) })
            ?? ExerciseDay(date: date)
            }
        }   
    }
}

struct BarChartWeekView_Previews: PreviewProvider {
  static var previews: some View {
    BarChartWeekView()
      .environmentObject(HistoryStore(preview: true))
  }
}
