//
//  GhostButtonExtension.swift
//  MovieMaze
//
//  Created by visith kumarapperuma on 2025-11-03.
//

import SwiftUI

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
