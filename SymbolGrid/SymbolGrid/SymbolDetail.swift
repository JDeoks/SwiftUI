//
//  SymbolDetail.swift
//  SymbolGrid
//
//  Created by 서정덕 on 2023/02/02.
//

import SwiftUI

struct SymbolDetail: View {
    var symbolVal: Symbol
    
    var body: some View {
        VStack{
            Text(symbolVal.name)
                .font(.largeTitle)
            Image(systemName: symbolVal.name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbolVal: Symbol(name: "brain.head.profile"))
    }
}
