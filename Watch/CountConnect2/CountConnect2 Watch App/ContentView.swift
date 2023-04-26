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
    @State var str: String = ""
    @State private var crownValue = 0.0
    @State var crownIndex: Int = 0
    @State var lastCrown = 0.0

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

        Text("idx:\(crownIndex) char: \(String(str[crownIndex]))")
            // \(str[crownIndex])로 하면 오류 발생해서 String으로 묶음
            .onAppear {
                print(self.model.messageText)
            }

        
 
        Text("\(crownIndex)")
            .font(.largeTitle)
            .focusable()
            // $crownValue 위치에 값 받을 변수 넣음
            .digitalCrownRotation($crownValue) { DigitalCrownEvent in
                // DigitalCrownEvent.offset 으로 크라운값 받기 가능
                if crownValue > lastCrown + 10 {
                    lastCrown = crownValue
                    if crownIndex < str.count - 1 {
                        //진동
                        crownIndex += 1
                    }
                    
                }
                else if crownValue <  lastCrown - 10 {
                    lastCrown = crownValue
                    if crownIndex > 0 {
                        //진동
                        crownIndex -= 1
                    }
                }
//                crownIndex = Int(DigitalCrownEvent.offset)/10
            }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    subscript(_ index: Int) -> Character {
        if 0 <= index && index < self.count  {
            return self[self.index(self.startIndex, offsetBy: index)]
        }
       return Character(" ")
    }
}
