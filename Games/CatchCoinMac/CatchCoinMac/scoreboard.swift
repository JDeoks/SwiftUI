//
//  scoreboard.swift
//  CatchCoinMac
//
//  Created by 서정덕 on 2023/04/10.
////
//
import SwiftUI

struct scoreboard: View {
    var score: Int
    var body: some View {

        ZStack {
            
            HStack {
                Spacer()
                VStack{
                    Text("Score")
                        .font(.title)
                    Text("\(score)")
                        .font(.largeTitle)
                    Spacer()

                        
                }
                VStack{
                    Text("Good Job!")
                        .font(.title)
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.title)
                }
                Spacer()

            }
            
        }
    }
}

struct scoreboard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
