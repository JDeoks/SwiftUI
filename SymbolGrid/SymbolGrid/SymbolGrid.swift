//
//  SymbolGrid.swift
//  SymbolGrid
//
//  Created by 서정덕 on 2023/02/02.
//

import SwiftUI

struct SymbolGrid: View {
    @State private var isAddingSymbol = false
    private static let initialColumns = 3
    @State private var selectedSymbol: Symbol?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var symbols = [
           Symbol(name: "tshirt"),
           Symbol(name: "eyes"),
           Symbol(name: "eyebrow"),
           Symbol(name: "nose"),
           Symbol(name: "mustache"),
           Symbol(name: "mouth"),
           Symbol(name: "eyeglasses"),
           Symbol(name: "facemask"),
           Symbol(name: "brain.head.profile"),
           Symbol(name: "brain"),
           Symbol(name: "icloud"),
           Symbol(name: "theatermasks.fill"),
           Symbol(name: "moon.stars")

       ]
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        Image(systemName: symbol.name)
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                }
            }
        }
    }
}
struct SymbolGrid_Previews: PreviewProvider {
    static var previews: some View {
        SymbolGrid()
    }
}
