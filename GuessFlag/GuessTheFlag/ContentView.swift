//
//  ContentView.swift
//  GuessFlag
//
//  Created by Raul Lamas on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showingContinue = false
    @State private var showingPlayAgain = false
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack {
                Spacer()

                Text("Guess the Flag ")
                    .mainTitle()
                
                RoundView(
                    viewModel: viewModel,
                    showingScore: $showingContinue
                )
                .alert(
                    viewModel.alertTitle,
                    isPresented: $showingContinue,
                    actions: { continueButton },
                    message: { continueMessage }
                )
                
                Spacer()
                Spacer()
                
                Text("Score: \(viewModel.score)")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            .padding()
        }
        .alert(
            viewModel.alertTitle,
            isPresented: $showingPlayAgain,
            actions: { playAgainButton },
            message: { playAgainMessage }
        )
    }
    
    var backgroundGradient: some View {
        RadialGradient(
            stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.12, green: 0.18 , blue: 0.26), location: 0.3)
            ],
            center: .top,
            startRadius: 200,
            endRadius: 700
        )
        .ignoresSafeArea()
    }
    
    var continueButton: some View {
        Button("Continue", action: nextTurn)
    }
    
    var playAgainButton: some View {
        Button("Play again", action: playAgain)
    }
    
    var continueMessage: some View {
        Text("Your score is \(viewModel.score)!")
    }
    
    var playAgainMessage: some View {
        Text(
        """
            You scored \(viewModel.score) out of 8.
            \(viewModel.score <= 4 ? "You can do better" : "Great job!")
        """
        )
    }

    func nextTurn() {
        if viewModel.numOfPlays < 8 {
            viewModel.shuffleCountries()
            viewModel.chooseNewIndex()
        } else {
            showingPlayAgain.toggle()
            viewModel.editAlertTitle("Game over")
        }
    }
    
    func playAgain() {
        viewModel.reset(metric: &viewModel.numOfPlays) 
        viewModel.reset(metric: &viewModel.score)
        nextTurn()
    }
}

#Preview {
    ContentView()
}
