//
//  ContentView.swift
//  ProgressBar
//
//  Created by Work on 13/11/24.
//

import SwiftUI

struct ContentView: View {

    let columns = Array.init(repeating: GridItem(), count: 3)
    @State private var progress: Float = 0.15

    var body: some View {
        LazyVGrid(columns: columns, spacing: 50) {
            ProgressBar(progress: progress)
                .onTapGesture {
                    progress += 0.1
                }
            ProgressBar(progress: 0.25)
            ProgressBar(progress: 0.35)
            ProgressBar(progress: 0.45)
            ProgressBar(progress: 0.55)
            ProgressBar(progress: 0.65)
            ProgressBar(progress: 0.75)
            ProgressBar(progress: 0.85)
            ProgressBar(progress: 0.95, isShowProgressLabel: false)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
