//
//  ContentView.swift
//  SharedIndex
//
//  Created by 서정덕 on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var counterManager = CounterManager.shared
    
    var body: some View {
        VStack {
            Text("\(counterManager.message)")
                .font(.largeTitle)
            Text("\(counterManager.count)")
                .font(.largeTitle)
            Button {
                counterManager.sendMessage2Watch(messageText: "Hello")
            } label: {
                Text("Hello")
            }

            HStack {
                Button(action: {
                    counterManager.decreaseCount()
                }) {
                    Text("-")
                }
                .padding()

                Button(action: {
                    counterManager.increaseCount()
                }) {
                    Text("+")
                }
                .padding()
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

