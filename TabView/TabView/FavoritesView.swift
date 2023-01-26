//
//  FavoritesView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack {
            Color(hex: "aff28b")
            VStack{
                Text("Favorites")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(20)
                
                HStack{
                    Text("Hobbies")
                        .font(.title2)
                    Spacer()
                }
                .padding(.leading)
                
                HStack(spacing: 20){
                    //spacing: 요소마다 간격 띄우기
                    Text("🚵‍♀️")
                        .font(.system(size: 48))
                        .cornerRadius(20)
                        //폰트 숫자로 설정
                    Text("🏄‍♀️")
                        .font(.system(size: 48))
                    Text("🏂")
                        .font(.system(size: 48))
                    Spacer()
                }
                .padding()
                
                Divider()
                
                HStack{
                    Text("Foods")
                        .font(.title2)
                    Spacer()
                }
                .padding(.leading)
                
                ScrollView(.horizontal){
                    HStack(spacing: 30) {
                        Text("🥐")
                            .font(.system(size: 48))
                        Text("🌮")
                            .font(.system(size: 48))
                        Text("🍣")
                            .font(.system(size: 48))
                        Text("🍉")
                            .font(.system(size: 48))
                        Text("🥖")
                            .font(.system(size: 48))
                        Text("🍙")
                            .font(.system(size: 48))
                        Text("🍫")
                            .font(.system(size: 48))
                        Text("🥞")
                            .font(.system(size: 48))
                    }
                
                }
                .padding()
                
                Divider()
                
                DisclosureGroup {
                    //https://zeddios.tistory.com/1179
                    HStack{
                        Color.purple
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                        Color(hue: 0.9, saturation: 0.5, brightness: 0.9)
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                        Color.orange
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                } label: {
                    Text("Guess my favorite colors")
                        .font(.title2)
                }
                .padding()
                /*#-code-walkthrough(FavoritesView.accent)*/
                .accentColor(.blue)
            }
            .background(Color(hex: "FFFFFF"))
            .cornerRadius(15)
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
