//
//  ContentView.swift
//  SharedIndex
//
//  Created by 서정덕 on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var counter = CounterManager()

    var body: some View {
        VStack {
            Text("\(counter.count)")
                .font(.largeTitle)

            HStack {
                Button(action: counter.decrement) {
                    Text("-")
                }
                .padding()

                Button(action: counter.increment) {
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
