//
//  ContentView.swift
//  FlappyBirdUIMac
//
//  Created by 서정덕 on 2023/05/04.
//

import SwiftUI

struct FlappyBirdGameView: View {
    @State var birdPosition: CGPoint = CGPoint(x: 50, y: 250)
    @State var birdVelocity: CGFloat = 0.0
    @State var gameOver: Bool = false
    let gravity: CGFloat = 0.8
    let jumpImpulse: CGFloat = -10.0 // 새가 뛰어올라야 하는 높이
    let obstacleSize: CGSize = CGSize(width: 50, height: 200)
    let obstacleGap: CGFloat = 150
    let obstacleSpeed: CGFloat = -3.0
    @State var obstacles: [(top: CGPoint, bottom: CGPoint)] = []
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            ForEach(obstacles.indices, id: \.self) { index in
                Group {
                    Path { path in
                        path.move(to: obstacles[index].top)
                        path.addLine(to: CGPoint(x: obstacles[index].top.x, y: obstacles[index].top.y - obstacleSize.height))
                        path.addLine(to: CGPoint(x: obstacles[index].top.x + obstacleSize.width, y: obstacles[index].top.y - obstacleSize.height))
                        path.addLine(to: CGPoint(x: obstacles[index].top.x + obstacleSize.width, y: obstacles[index].top.y))
                        path.closeSubpath()
                    }.fill(Color.green)
                    Path { path in
                        path.move(to: obstacles[index].bottom)
                        path.addLine(to: CGPoint(x: obstacles[index].bottom.x, y: obstacles[index].bottom.y + obstacleSize.height))
                        path.addLine(to: CGPoint(x: obstacles[index].bottom.x + obstacleSize.width, y: obstacles[index].bottom.y + obstacleSize.height))
                        path.addLine(to: CGPoint(x: obstacles[index].bottom.x + obstacleSize.width, y: obstacles[index].bottom.y))
                        path.closeSubpath()
                    }.fill(Color.green)
                }
            }
            Circle()
                .frame(width: 200, height: 200)
                .position(birdPosition)
                .foregroundColor(Color.yellow)
                .onTapGesture {
                    if !gameOver {
                        birdVelocity = jumpImpulse // 탭하면 새가 뛰어오르도록 함
                    } else {
                        restartGame()
                    }
                }
        }
        .onAppear {
            startGame()
        }
        .alert(isPresented: $gameOver) {
            Alert(
                title: Text("Game Over"),
                message: Text("You lost the game!"),
                dismissButton: .default(Text("Restart"), action: {
                    restartGame()
                })
            )
        }
    }
    
    func startGame() {
        Timer.scheduledTimer(withTimeInterval: 1.0/60.0, repeats: true) {_ in
            if !gameOver {
                updateGame()
            }
        }
        addObstacle()
    }
    
    func updateGame() {
        birdVelocity += gravity
        birdPosition.y += birdVelocity
        for index in obstacles.indices {
            obstacles[index].top.x += obstacleSpeed
            obstacles[index].bottom.x += obstacleSpeed
            if obstacles[index].top.x < -obstacleSize.width {
                obstacles.remove(at: index)
                addObstacle()
            }
            if (birdPosition.x + 25 > obstacles[index].top.x) && (birdPosition.x - 25 < obstacles[index].top.x + obstacleSize.width) {
                if (birdPosition.y - 25 < obstacles[index].top.y) || (birdPosition.y + 25 > obstacles[index].bottom.y) {
                    gameOver = true
                }
            }
        }
    }
    
    func addObstacle() {
        let topY = CGFloat.random(in: 100...300)
        let bottomY = topY - obstacleGap - obstacleSize.height
        obstacles.append((CGPoint(x: 500, y: topY), CGPoint(x: 500, y: bottomY)))
    }
    
    func restartGame() {
        birdPosition = CGPoint(x: 50, y: 250)
        birdVelocity = 0.0
        gameOver = false
        obstacles.removeAll()
        addObstacle()
    }
}


struct ContentView: View {
    var body: some View {
        FlappyBirdGameView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
