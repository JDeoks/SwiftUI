//
//  FunFactsView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct FunFactsView: View {
    
    var allFunFacts: [String] =
    [
        "There are 12,600 people in my town.",
        "There is a farmers market every Wednesday in the summer.",
        "There is a creek that runs through town."
    ]
    
    @State private var funFact = ""
    //state 변수
    
    var body: some View {
        ZStack {
            Color(hex: "f0d689")
            VStack {
                Spacer()
                VStack {
                    Text("Fun Facts")
                        .font(.largeTitle)
                        .padding()
                    .fontWeight(.bold)
                    Text(funFact)
                        .padding()
                        .font(.title)
                        .frame(maxWidth: 400, maxHeight: 200)
                        .background(Color(hex: "f0e5a4"))
                        .cornerRadius(15)
                        .padding([.bottom, .leading, .trailing])
                }
                .background()
                .cornerRadius(15)
                .padding()
                
                Button("Show random Facts") {
                    funFact = allFunFacts.randomElement() ?? "no fun."
                }
                .padding()
                .background(in: RoundedRectangle(cornerRadius: 15))
                
                Button("reset") {
                    funFact = ""
                }
                .padding()
                .background(in: RoundedRectangle(cornerRadius: 15))
                Spacer()
                Spacer()
            }
        }
        .ignoresSafeArea()
       
    }
}

struct FunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactsView()
    }
}
