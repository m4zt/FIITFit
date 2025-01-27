//
//  SuccessView.swift
//  FIITFit
//
//  Created by Student on 1/26/25.
//

import SwiftUI

struct SuccessView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Image(systemName: "hand.raised.fill")
                .resizedToFill(width: 75, height: 75)
                .foregroundColor(Color.purple)
            Text("High Five!")
                .fontWeight(.heavy)
                .padding(.top)
                .font(.largeTitle)
            Text("""
            Good job completing all four excerises!
            Remember tommorow's another day.
            So eat well and get some rest.
            """)
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            
            ZStack {
                Button("Continue") {
                    selectedTab = 9
                    dismiss()
                }
                    .padding(.top)
            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
        .presentationDetents([.medium, .large])
}
