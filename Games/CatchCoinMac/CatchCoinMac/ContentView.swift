//
//  ContentView.swift
//  CatchCoinMac
//
//  Created by 서정덕 on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    @State var isGameEnded = false
    @State var balls: [Ball] = []
    @State var score: Int = 0
    @State var time: Int = 30
    let ballCount = 7
    
    var body: some View {
        // 할당된 view의 좌표 정보 알기 위해 감쌈
        ZStack {
            Color(hex: "f8ede3")
            VStack{
                HStack{
                    Spacer()

                    VStack{
                        Text("score")
                            .font(.title)
                            .foregroundColor(Color(hex: "#ff8882"))
                        Text("\(score)")
                            .font(.title)
                            .foregroundColor(Color(hex: "#ff8882"))
                    }
                    VStack{
                        Text("Time")
                            .font(.title)
                            .foregroundColor(Color(hex: "#ff8882"))
                        Text("\(time)")
                            .font(.title)
                            .foregroundColor(Color(hex: "#ff8882"))
                            .onAppear{
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    if time > 0 {
                                        time -= 1
                                    } else {
                                        // 시간이 0이면 ScoreboardView 표시
                                        isGameEnded = true
                                    }
                                }
                                
                            }
                    }
                    .padding()

                    
                }

                GeometryReader { geometry in
                    //  ZStack은 겹치는 뷰들 중 상위 뷰를 맨 위에 표시, z-index를 알 필요 없이 간단히 구현
                    ZStack {
                        ForEach(balls.indices, id: \.self) { index in
                            // ball이 구역안에 있으면
                            if balls[index].isInside(geometry: geometry){
                                ZStack {
                                    Circle()
                                        .fill(balls[index].color)
                                        .frame(width: balls[index].size, height: balls[index].size)
                                    balls[index].label // 라벨 추가
                                }
                                    .position(balls[index].position) // position 메서드에 geometry 전달
                                    //터치하면 3초 정지 구현
                                    .gesture(
                                        TapGesture(count: 1)
                                            .onEnded {
                                                // 각 ball은 여러번 눌러도 한번만 적용 되어야 함
                                                if balls[index].touched == false{
                                                    // ball의 점수만큼 점수+
                                                    score += balls[index].point
                                                    balls[index].touched = true
                                                    // ball 멈추기
                                                    balls[index].isStopped = true

                                                    balls[index].timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                                                        balls[index].reproduceBall(geometry: geometry)
                                                        balls[index].isStopped = false
                                                }

                                                }
                                            }
                                    )
                            }

                        }
                    }
                    .onAppear {
                        for _ in 0..<ballCount {
                            balls.append(Ball(in: geometry))
                        }
                        startTimer(geometry: geometry)
                    }
                    .onDisappear {
                        //GeometryReader뷰가 화면에서 사라지면 ball 배열 초기화
                        balls.removeAll()
                    }
                }

            }
            
        }
        .fullScreenCover(isPresented: $isGameEnded) {
            scoreboard(score: score)
        }
    }
    /// GeometryProxy를 받아
    func startTimer(geometry: GeometryProxy) {
        // 0.05초마다 반복, 항상 반복, 반복시마다 아래 클로저 실행
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            // balls안의 모든 ball에 대해서 위치 업데이트 수행
            for i in 0..<balls.count {
                balls[i].updatePosition(in: geometry)
            }
        }
    }
}

struct Ball: Identifiable {
    var touched: Bool = false
    let id = UUID()
    /// 원의 위치
    var position: CGPoint
    var size: CGFloat
    var color: Color
    /// 움직이는 상태 여부
    var isStopped: Bool = false
    /// 각각의 객체에 할당된 타이머
    var timer: Timer?
    var point: Int
    var label: Text
    var speed: CGFloat = CGFloat((Int.random(in: 5...15)))
    
    /// 초기화 함수 상위 view의 GeometryProxy를 받아 초기화 함
    init(in geometry: GeometryProxy) {
        // 처음 위치를 초기화
        position = Ball.getRandomPositon(in: geometry)
        // 사이즈 랜덤으로 설정
        size = CGFloat.random(in: 50...100)
        color = .random
        point = (Int.random(in: 1...10))*10
        label = Text(String(point))
    }
    /// 원을 내려가게 하는 함수, 각 객체에 설정된 speed 만큼 y좌표값을 더해준다.
    mutating func updatePosition(in geometry: GeometryProxy) {
        // isStopped상태에 따라 움직일지 말지 결정, 뷰가 화면을 벗어났다면 다시 생성함
        if  !isStopped {
            position = CGPoint(x: position.x, y: position.y + speed)
            if !isInside(geometry: geometry) {
                //reproduceBall
                reproduceBall(geometry: geometry)
            }
        }
    }
    
    /// ball 이 geometry view에서 벗어났는지 확인하는 함수
    func isInside(geometry: GeometryProxy) -> Bool {
            let minX = -size
            let maxX = geometry.size.width + size
            let minY = -size
            let maxY = geometry.size.height + size
            
            return (minX...maxX).contains(position.x) && (minY...maxY).contains(position.y)
    }
    
    /// ball 객체의 프로퍼티를 전부 새로 바꾸는 함수
    mutating func reproduceBall(geometry: GeometryProxy) {
        position = Ball.getRandomPositon(in: geometry)
        point = (Int.random(in: 1...10))*10
        size = CGFloat.random(in: 50...100)
        label = Text(String(point))
        color = .random
        touched = false
    }
    
    /// GeometryProxy를 받아서 랜덤한 위치를 반환
    static func getRandomPositon(in geometry: GeometryProxy) -> CGPoint {
        return CGPoint(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height/3))
    }

}


// 컬러 랜덤
extension Color {
    static var random: Color {
        let V = Double.random(in: 0.1...0.6)
        return Color(
            red: V,
            green: V,
            blue: V
        )
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
