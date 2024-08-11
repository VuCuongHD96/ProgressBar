//
//  Color+.swift
//
//
//  Created by Work on 10/8/24.
//

import SwiftUI

extension Color {
    public static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    Rectangle()
        .fill(Color.random)
}
