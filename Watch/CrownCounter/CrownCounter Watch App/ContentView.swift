//
//  ContentView.swift
//  CrownCounter Watch App
//
//  Created by 서정덕 on 2023/04/06.
//

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-digital-crown-on-watchos-using-digitalcrownrotation
// https://developer.apple.com/documentation/swiftui/view/digitalcrownrotation(_:onchange:onidle:)
import SwiftUI
import WatchKit

struct ContentView: View {
    
    var arr = ["a", "b", "c", "d", "e"]
    @State private var crownValue = 0.0

    var body: some View {
        Text(arr[Int(crownValue)%5])
            .font(.largeTitle)
            .focusable()
            .digitalCrownRotation($crownValue)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
