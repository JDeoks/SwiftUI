//
//  ContentView.swift
//  DragGestureAnalyzer
//
//  Created by 서정덕 on 2023/05/24.
//


import SwiftUI

struct ContentView: View {
    // 시작하는 좌표 부모뷰의 좌상단이
    @State private var startLocation: CGPoint?
    @State private var currentLocation: CGPoint?
    @State private var velocity: CGSize = .zero
    @State private var displacement: CGSize = .zero
    @State private var time: Double = 0.0
    @State private var angle: CGFloat = 0.0
    
    @State private var isOnDrag = false
    @State private var timer: Timer?
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("속력: \(velocity.width), \(velocity.height)")
                .font(.headline)
            
            Text("변위: \(displacement.width), \(displacement.height)")
                .font(.headline)
            
            Text("시간: \(time)")
                .font(.headline)
            
            Text("각도: \(angle)")
                .font(.headline)
            
            Text("거리: \(distance)")
                .font(.headline)
            
            Rectangle()
                .frame()
                .gesture(DragGesture()
                    .onChanged { gesture in
                        if startLocation == nil {
                            startLocation = gesture.startLocation
                            resetValues()
                            startTimer()
                            isOnDrag = true
                        }
                        print(gesture.location)
                        
                        currentLocation = gesture.location
                        
                        if let start = startLocation, let current = currentLocation {
                            // 이동 거리 및 속도 계산
                            displacement = CGSize(width: current.x - start.x, height: current.y - start.y)
                            let deltaX = current.x - start.x
                            let deltaY = current.y - start.y
                            velocity = CGSize(width: deltaX / CGFloat(time), height: deltaY / CGFloat(time))
                            
                            // 각도 계산
                            angle = angleBetweenPoints(start: start, end: current)
                        }
                    }
                    .onEnded { gesture in
                        stopTimer()
                        startLocation = nil
                        isOnDrag = false
                    })
        }
    }
    
    var distance: Double {
        let dx = Double(displacement.width)
        let dy = Double(displacement.height)
        return sqrt(dx * dx + dy * dy)
    }
    
    func resetValues() {
        velocity = .zero
        displacement = .zero
        time = 0.0
        angle = 0.0
    }
    
    func startTimer() {
        stopTimer()
        time = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.isOnDrag {
                self.time += 0.01
            } else {
                timer.invalidate()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func angleBetweenPoints(start: CGPoint, end: CGPoint) -> CGFloat {
        let deltaX = end.x - start.x
        let deltaY = end.y - start.y
        var angle = atan2(deltaY, deltaX) * 180 / .pi
        if angle < 0 {
            angle += 360
        }
        return angle
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
