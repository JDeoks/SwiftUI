//
//  ContentView.swift
//  Connectivity Watch App
//
//  Created by 서정덕 on 2023/04/06.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
    
    var body: some View {
        Text(self.model.messageText)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
