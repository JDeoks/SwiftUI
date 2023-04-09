//
//  Scoreboard.swift
//  CatchCoin
//
//  Created by 서정덕 on 2023/04/10.
//

import SwiftUI

struct scoreboard: View {
    @Binding var isGameEnded: Bool
    @Binding var score: Int
    @Binding var time: Int
    var lastScore: Int
    
    var body: some View {

        ZStack {
            Color(hex: "f8ede3")
                .ignoresSafeArea()
            VStack{
                HStack {
                    Spacer()
                    VStack{
                        Text("Score")
                            .font(.title)
                        Text("\(lastScore)")
                            .font(.title)
                    }
                    VStack{
                        Text("Good Job!")
                            .font(.title)
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.title)
                    }

                    Spacer()

                }
                Button("Close") {
                    // 닫기 버튼을 누르면 isGameEnded 값을 false로 설정
                    isGameEnded = false
                    score = 0
                    time = 10
                }
                    .padding()
            }
            .foregroundColor(Color(hex: "#ff8882"))
        }
    }
}
