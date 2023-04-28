//
//  ContentView.swift
//  GestureRecMac
//
//  Created by 서정덕 on 2023/04/28.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.white
    @State private var isDragging = false
    @State private var dragLocation: CGPoint = .zero

    private let rectangleSize: CGSize = CGSize(width: 200, height: 200)

    private func isInsideRectangle(_ location: CGPoint, geometry: GeometryProxy) -> Bool {
        let rect = CGRect(origin: CGPoint(x: (geometry.size.width - rectangleSize.width) / 2,
                                          y: (geometry.size.height - rectangleSize.height) / 2),
                          size: rectangleSize)
        return rect.contains(location)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.blue)
                    .frame(width: rectangleSize.width, height: rectangleSize.height)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        isDragging = true
                        dragLocation = value.location
                        if isInsideRectangle(dragLocation, geometry: geometry) {
                            backgroundColor = Color.red
                        } else {
                            backgroundColor = Color.white
                        }
                    }
                    .onEnded { _ in
                        isDragging = false
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
