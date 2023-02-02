//
//  Symbol.swift
//  SymbolGrid
//
//  Created by 서정덕 on 2023/02/02.
//

import SwiftUI

struct Symbol: Identifiable, Equatable {
    // 인스턴스 생성 Symbil(name: "eyes")
    // 데이터 모델에 Identifiable 프로토콜추가는 ForEach에 좋은 패턴 업데이트 위해서는 고유 id 필요하기 때문
    var id = UUID()
    var name: String
}

