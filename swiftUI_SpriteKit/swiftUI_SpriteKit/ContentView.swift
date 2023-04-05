//
//  ContentView.swift
//  swiftUI_SpriteKit
//
//  Created by 서정덕 on 2023/04/06.
//

import SwiftUI
import SpriteKit

struct GameView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        // Create a new SKView and set it up for SpriteKit
        let skView = SKView()
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // Create a new SKScene
        let scene = SKScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        // Add content to the scene
        let sprite = SKSpriteNode(imageNamed: "exampleSprite")
        sprite.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.addChild(sprite)
        
        // Present the scene in the SKView
        skView.presentScene(scene)
        
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        // Update the SKScene if needed
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My Game")
                .font(.title)
            
            // Add the GameView to the SwiftUI layout
            GameView()
                .frame(width: 300, height: 300)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
