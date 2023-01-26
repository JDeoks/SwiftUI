//
//  ContentView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            //
            HomeView()
                .tabItem {
                    //https://seons-dev.tistory.com/entry/SwiftUI-Label%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%9D%BC%EB%B2%A8%EC%8A%A4%ED%83%80%EC%9D%BC-%EB%A7%8C%EB%93%A4%EA%B8%B0
                    Label("home", systemImage: "person")
                }
            StoryView()
                .tabItem{
                    Label("stroy", systemImage: "book")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
