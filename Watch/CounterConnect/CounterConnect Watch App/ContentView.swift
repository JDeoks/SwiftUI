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
    @State var str = ""
    @State private var crownValue = 0.0
    @State var crownIndex = 0

    var body: some View {
        Text("값: \(str)")
            // 변화를 감지할 변수이름에 $를 붙여 감시, 파라미터는 변화한 값
            .onReceive(self.model.$messageText) { message in
                self.str = message
            }
//            .onAppear {
//                print(self.model.messageText)
//            }
        
///////////////        텍스트 인뎃스로 접근 구현해야되고오버플로우 ㄹ발생 차단 해햐함
        Text("현재 char: \(str[crownIndex])")
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
