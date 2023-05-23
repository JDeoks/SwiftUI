//
//  ContentView.swift
//  HapticUI
//
//  Created by 서정덕 on 2023/05/23.
//

import SwiftUI

struct ContentView: View {
    let feedbackGenerators = [
        UIImpactFeedbackGenerator(style: .light),
        UINotificationFeedbackGenerator(),
        UISelectionFeedbackGenerator()
    ]
    
    let feedbackStyles: [UIImpactFeedbackStyle] = [
        .light, .medium, .heavy
    ]
    
    var body: some View {
        VStack {
            ForEach(feedbackStyles, id: \.self) { style in
                Button(action: {
                    feedbackGenerators[0].impactOccurred(intensity: 0.5) // Change the intensity as desired
                }) {
                    Text(style.rawValue)
                }
            }
            
            Button(action: {
                feedbackGenerators[1].notificationOccurred(.success)
            }) {
                Text("Success Notification")
            }
            
            Button(action: {
                feedbackGenerators[2].selectionChanged()
            }) {
                Text("Selection Changed")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
