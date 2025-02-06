//
//  FIITFitApp.swift
//  FIITFit
//
//  Created by Student on 1/26/25.
//

import SwiftUI

@main
struct FIITFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .onAppear{ print(URL.documentsDirectory) }
                .alert(isPresented: $historyStore.loadingError) {
                    Alert(
                        title: Text("History"),
                        message: Text(
                            """
                            Unfortunately we can't load your past history. 
                            Email support: support@xyz.com
                            """
                        )
                    )
                }
        }
    }
}
