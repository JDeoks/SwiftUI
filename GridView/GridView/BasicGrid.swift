//
//  BasicGrid.swift
//  GridView
//
//  Created by 서정덕 on 2023/01/26.
//

import SwiftUI

struct BasicGrid: View {
    var body: some View {
        Grid(alignment: .top, horizontalSpacing: 20, verticalSpacing: 40){
            GridRow{
                Color.mint
                Color.orange
                Color.pink
            }
            Text("No color here")
                .gridCellAnchor(.center)
                //개별 그리드 셀에 대한 조정 가능
            GridRow{
                Color.blue
                Color.teal
                    .gridCellColumns(2)
            }
            //가장 많은 뷰를 가진 행이 그리드뷰의 열 수를 결정함
            GridRow(alignment: .bottom) {
                Text("I’m on the bottom of the view!")
                Color.red
            }
            
        }
    }
}

struct BasicGrid_Previews: PreviewProvider {
    static var previews: some View {
        BasicGrid()
    }
}
