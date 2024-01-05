//
//  CountryManager.swift
//  GuessFlag
//
//  Created by Raul Lamas on 11/25/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var countries: [String]
    @Published var score: Int // use private(set) for all
    @Published var numOfPlays: Int
    @Published private(set) var alertTitle: String
    @Published private(set) var chosenIndex: Int
    
    init() {
        self.countries = [
            "Estonia", "France", "Germany", "Ireland", "Italy",
            "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"
        ]
            .shuffled()
        self.score = 0
        self.numOfPlays = 0
        self.alertTitle = ""
        self.chosenIndex = Int.random(in: 0...2)
    }
    
    func chooseNewIndex() { chosenIndex = Int.random(in: 0...2) }

    func editAlertTitle(_ newTitle: String) { alertTitle = newTitle }
    
    func increment(metric: inout Int) { metric += 1 }
    
    func reset(metric: inout Int) { metric = 0 }
    
    func shuffleCountries() { countries.shuffle() }

    func tapFlag(_ number: Int) {
        if numOfPlays < 8 {
            if number == chosenIndex {
                editAlertTitle("Correct")
                increment(metric: &score)
            } else {
                editAlertTitle("Wrong! That's the flag of \(countries[number])")
            }
            increment(metric: &numOfPlays)
        }
    }
}
