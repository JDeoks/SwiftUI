//
//  ContentView.swift
//  GridView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    
    //그리드 아이템 객체를 요소로 갖는 배열 생성
    let columnLayout: [GridItem] = Array(repeating: GridItem(), count: 3)
    
    let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columnLayout) {
                ForEach(allColors.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .aspectRatio(1, contentMode: .fit)
                        // 뷰 가로세로 비율 조정
                        .foregroundColor(allColors[index])
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
