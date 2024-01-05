//
//  Customs.swift
//  GuessFlag
//
//  Created by Raul Lamas on 11/25/23.
//

import SwiftUI

extension VStack {
    func ultraThin() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

extension Text {
    func mainTitle() -> some View {
        self
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
    
    func subTitle() -> some View {
        self
            .foregroundStyle(.secondary)
            .font(.subheadline)
            .fontWeight(.medium)
    }
    
    func highlight() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}
