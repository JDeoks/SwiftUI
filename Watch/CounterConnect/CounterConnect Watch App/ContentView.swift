//
//  ContentView.swift
//  CounterConnect Watch App
//
//  Created by 서정덕 on 2023/04/06.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
    var arr = Array("")
    @State private var crownValue = 0.0
    @State var crownIndex = 0

    var body: some View {
        Text("값: \(self.model.messageText)")
            .onAppear {
                print(self.model.messageText)
            }
        
 
        Text(String(crownIndex))
            .font(.largeTitle)
            .focusable()
            // $crownValue 위치에 값 받을 변수 넣음
            .digitalCrownRotation($crownValue) { DigitalCrownEvent in
                // DigitalCrownEvent.offset 으로 크라운값 받기 가능
                crownIndex = Int(DigitalCrownEvent.offset)/10
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
