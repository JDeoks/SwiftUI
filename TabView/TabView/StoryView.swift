//
//  StoryView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct StoryView: View {
    var body: some View {

        ScrollView{
            
            VStack(alignment: .leading){
                Group{
                    Text("SeoJeongDeok")
                        .font(.largeTitle)
                    Text("your name")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Divider()
                }
                Text("Everyone knows that I just love …")
                    .padding([.top, .bottom])
                Text("My super power is …")
                    .padding(.bottom)
                Group {
                    HStack {
                        Text("In my life, I feel most grateful for …")
                        Image("Placeholder")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)// 코너 곡률
                            .foregroundColor(.gray)
                    }
                }
                Group {
                    Divider()
                    Text("Get the most out of this section")
                        .font(.title3)
                        .foregroundColor(.cyan)
                    Text("This is where you write something you really want to emphasize. The thing you want people to take away after reading your story.")
                        .italic()
                    Divider()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(in: RoundedRectangle(cornerRadius: 15))
            .padding()
            VStack(alignment: .leading) {
                Group {
                    Text("Another Story")
                        .font(.largeTitle)
                    Text("Author")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Divider()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(in: RoundedRectangle(cornerRadius: 15))
            .padding()
            //패딩 순서 중요
        }
        
        
        //스크롤뷰에는 패딩 넣으면 안됨 올라가면서 잘림
        .background(Color(R: 222, G: 190, B: 222))
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
