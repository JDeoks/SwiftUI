//
//  HomeView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(hex: "89d1dc")
            VStack{
                Text("All About")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Image(systemName: "person.fill")
                //  https://www.hohyeonmoon.com/blog/swiftui-tutorial-image/
                    .resizable()
                    // 사이즈 조절 가능
                    .scaledToFit()
                    // 비율 그대로
                    .frame(maxWidth: 250)
                    .padding(.all)
                    .clipShape(Circle())
                    // 원 모양으로 클립
                    .overlay(
                        Circle()
                            .stroke(Color(hex: "84b9dc"), style: StrokeStyle(lineWidth: 15))
                    )
                    // 테두리
                Text("JeongDeok")
                    .font(.largeTitle)
                    .padding()
                HStack{
                    Image(systemName: "sparkles")
                        .foregroundColor(.yellow)
                    Text("joyful")
                        .font(.largeTitle)
                        .foregroundColor(Color(hex: "7c9bdc"))
                        .padding()
                    Image(systemName: "sparkles")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
