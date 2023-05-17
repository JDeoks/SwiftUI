//
//  ContentView.swift
//  SegViewNavi
//
//  Created by 서정덕 on 2023/04/30.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selection, label: Text("Select a view")) {
                    Text("First View").tag(0)
                    Text("Second View").tag(1)
                    Text("Third View").tag(2)
                }.pickerStyle(SegmentedPickerStyle())

                Button(action: {
                    // 선택한 뷰로 이동하는 코드를 작성합니다.
                    switch selection {
                        case 0:
                            // 첫 번째 뷰로 이동하는 코드를 작성합니다.
                            NavigationLink(destination: FirstView()) {
                                EmptyView()
                            }
                            break
                        case 1:
                            // 두 번째 뷰로 이동하는 코드를 작성합니다.
                            break
                        case 2:
                            // 세 번째 뷰로 이동하는 코드를 작성합니다.
                            break
                        default:
                            break
                    }
                }, label: {
                    Text("Go to selected view")
                })
                Spacer()
            }.navigationTitle("Segmented Control")
        }
    }
}
struct FirstView: View {
    var body: some View {
        Text("FirstView")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
