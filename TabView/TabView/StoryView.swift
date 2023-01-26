//
//  StoryView.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            Color(hex: "217183217")
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
                
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
