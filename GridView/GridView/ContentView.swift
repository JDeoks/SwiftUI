//
//  ContentView.swift
//  GridView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedColor = Color.white

    //그리드 아이템 객체를 요소로 갖는 배열 생성
    let columnLayout: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20, maximum: 100))
    /*
     repeating: 에 대신 넣으면
        GridItem(.fixed(75), spacing: 20, alignment: .center) 크키가 고정됨
        GridItem(.flexible()) 유연한 크기조정
        GridItem(.flexible(minimum: 20, maximum: 100)) 최대 크기 있는 크기조정

     */

, count: 3)
    
    let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]
    
    var body: some View {
        ScrollView{
            Image("arizona")
                .resizable()
                .scaledToFit()
                .colorMultiply(selectedColor)
                .padding()
            LazyVGrid(columns: columnLayout) {
//                ForEach(allColors.indices, id: \.self) { index in
//                    RoundedRectangle(cornerRadius: 4)
//                        .aspectRatio(1, contentMode: .fit)
//                        // 뷰 가로세로 비율 조정
//                        .foregroundColor(allColors[index])
//                }
                ForEach(allColors.indices, id: \.self) { index in
                    Button {
                        selectedColor = allColors[index]
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .aspectRatio(1, contentMode: .fit)
                            // 뷰 비율
                            .foregroundColor(allColors[index])
                    }
                }
            }
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
