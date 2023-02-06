//
//  ContentView.swift
//  Guess-The-Badge
//
//  Created by Reza Gharooni on 04/02/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var footballTeams = ["Arsenal", "Aston Villa", "Bournemouth", "Chelsea", "Leicester", "Liverpool", "Manchester City", "Manchester United", "Newcastle", "Norwich", "Crystal Palace", "Southampton", "Sunderland", "Swansea", "Watford", "West Bromwich Albion", "West Ham"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("dark green"), .white, Color("dark green")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20){
                VStack {
                    Text("Tap the badge of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(footballTeams[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                VStack(spacing:30) {
                    ForEach(0..<3) { number in
                        Button {
                            badgeTapped(number)
                        } label: {
                            Image(footballTeams[number])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: 5)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if score == 1 {
                Text("Your score is \(score) point")
            } else {
                Text("Your score is \(score) points")
            }
            
        }
    }
    
    func badgeTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        footballTeams.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




