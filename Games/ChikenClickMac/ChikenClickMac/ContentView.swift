//
//  ContentView.swift
//  ChikenClickMac
//
//  Created by 서정덕 on 2023/04/17.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        ProgressBarView()
//    }
//}

struct ContentView: View {

    @State private var progressRed: CGFloat = 1.0
    @State private var progressBlue: CGFloat = 1.0
    @State var timeRemainingRed: Double = 10.0
    @State var timeRemainingBlue: Double = 10.0
    @State var turn = 0

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    let items = Array(1...25)
    
    var body: some View {
        ZStack {
            turn == 0 ? Color(hex: "#fadade") : Color(hex: "a0deee")
            GeometryReader{ geo in
                HStack {
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: geo.size.width*0.05, height: geometry.size.height * self.progressRed)
                    }
                    .onReceive(timer) { _ in
                        if self.turn == 0 {
                            if self.timeRemainingRed > 0 {
                                withAnimation(.easeOut(duration: 0.1)) {
                                    self.progressRed = CGFloat(self.timeRemainingRed) / 10
                                }
                                self.timeRemainingRed -= 0.1
                            } else {
    //                            self.timer.upstream.connect().cancel()
                            }
                        }
                    }
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())], spacing: 1) {
                        ForEach(items, id: \.self) { item in
                            Text("\(item)")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(0)
                        }
                    }
                    .frame(width: geo.size.width*0.9, height: geo.size.height)
                    

                    GeometryReader { geometry in
                        HStack{
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: geo.size.width*0.05, height: geometry.size.height * self.progressBlue)
                        }
                        .onReceive(timer) { _ in
                            if self.turn == 1 {
                                if self.timeRemainingBlue > 0 {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        self.progressBlue = CGFloat(self.timeRemainingBlue) / 10
                                    }
                                    self.timeRemainingBlue -= 0.1
                                } else {
        //                            self.timer.upstream.connect().cancel()
                                }
                            }
                        }

                    }

                }
            }

        }
        .cornerRadius(5)
        .onTapGesture {
            withAnimation {
                self.turn = 1 - self.turn
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
//struct ContentView: View {
//    var body: some View {
//        GeometryReader { geo in
//            HStack(alignment: .top) {
//                Text("Right")
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .fixedSize(horizontal: true, vertical: false)
//                    .padding(.trailing)
//            }
//            .frame(width: geo.size.width, alignment: .trailing) // 여기에 alignment를 추가합니다.
//        }
//    }
//}
