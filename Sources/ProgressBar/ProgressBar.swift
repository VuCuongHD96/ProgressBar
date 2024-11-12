// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct ProgressBar: View {
    
    private let lineWidth: CGFloat
    var progress: Float
    @State private var progressFinal: Float = 0
    private let color: Color
    private var isShowLabel = true
    
    public init(progress: Float, lineWidth: CGFloat, color: Color, isShow: Bool = true) {
        self.lineWidth = lineWidth
        self.progress = progress
        self.color = color
        self.isShowLabel = isShow
    }
    
    public init(progress: Float, lineWidth: CGFloat, isShow: Bool = true) {
        self.init(progress: progress, lineWidth: lineWidth, color: .random, isShow: isShow)
    }
    
    public init(progress: Float, isShow: Bool = true) {
        self.init(progress: progress, lineWidth: 8, isShow: isShow)
    }
    
    public var body: some View {
        let strokeStyle = StrokeStyle(lineWidth: lineWidth,
                                      lineCap: .round,
                                      lineJoin: .round)
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth * 0.5)
                .foregroundColor(color.opacity(0.5))
            Circle()
                .trim(from: 0, to: CGFloat(min(progressFinal, 1.0)))
                .stroke(style: strokeStyle)
                .foregroundColor(color)
                .rotationEffect(.degrees(270))
                .animation(.easeInOut(duration: 2.0), value: progressFinal)
        }
        .onAppear {
            progressFinal = progress
        }
        .overlay {
            if isShowLabel {
                let percent = String(format: "%.1f", progress * 100)
                Text("\(percent)%")
            }
        }
    }
}

struct ContentView: View {
    
    let columns = Array.init(repeating: GridItem(), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 50) {
            ProgressBar(progress: 0.15)
            ProgressBar(progress: 0.25)
            ProgressBar(progress: 0.35)
            ProgressBar(progress: 0.45)
            ProgressBar(progress: 0.55)
            ProgressBar(progress: 0.65)
            ProgressBar(progress: 0.75)
            ProgressBar(progress: 0.85)
            ProgressBar(progress: 0.95, isShow: false)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
