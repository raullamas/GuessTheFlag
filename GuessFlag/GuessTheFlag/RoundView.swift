//
//  RoundView.swift
//  GuessFlag
//
//  Created by Raul Lamas on 11/27/23.
//

import SwiftUI

struct RoundView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var showingScore: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text("Tap the flag of")
                    .subTitle()
                Text(viewModel.countries[viewModel.chosenIndex])
                    .highlight()
            }
            
            randomFlags
        }
        .ultraThin()
    }
    
    var randomFlags: some View {
        ForEach(0..<3) { number in
            Button {
                viewModel.tapFlag(number)
                showingScore.toggle()
            } label: {
                Image(viewModel.countries[number])
                    .clipShape(.capsule)
                    .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    RoundView(viewModel: ViewModel(), showingScore: .constant(true))
}
