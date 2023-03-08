//
//  ContentView.swift
//  SymbolGrid
//
//  Created by 서정덕 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
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
        NavigationStack {
            VStack{
            ScrollView{
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        //Symbol 배열인 symbols의 요소마다 symbol로 받아서 적용
                        NavigationLink{
                            SymbolDetail(symbolVal: symbol)
                        } label: {
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            SymbolPicker(symbol: $selectedSymbol)
        }
        .navigationTitle("My Symbols")
        }


        
    }
    
    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
    func remove(symbol: Symbol) {
        guard let index = symbols.firstIndex(of: symbol) else { return }
        withAnimation {
            _ = symbols.remove(at: index)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
