// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct ProgressBar: View {
    
    @State private var progressFinal: Float = 0
    
    var progress: Float
    let color: Color
    let lineWidth: CGFloat
    var isShowProgressLabel = true
    
    public init(progress: Float, color: Color = .random, lineWidth: CGFloat = 6, isShowProgressLabel: Bool = true) {
        self.progress = progress
        self.color = color
        self.lineWidth = lineWidth
        self.isShowProgressLabel = isShowProgressLabel
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
                .animation(.easeInOut(duration: 1.0), value: progressFinal)
        }
        .overlay {
            if isShowProgressLabel {
                let percent = String(format: "%.1f", progressFinal * 100)
                Text("\(percent)%")
                    .contentTransition(.numericText())
                    .animation(.spring, value: percent)
            }
        }
        .onChange(of: progress) { oldValue, newValue in
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                progressFinal = newValue
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                progressFinal = progress
            }
        }
    }
}
