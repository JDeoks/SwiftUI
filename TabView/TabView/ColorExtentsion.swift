//
//  ColorExtentsion.swift
//  TabView
//
//  Created by 서정덕 on 2023/01/26.
// https://seons-dev.tistory.com/entry/CODE-SwiftUI-%EC%BB%AC%EB%9F%AC-%EC%9D%B5%EC%8A%A4%ED%85%90%EC%85%98-%EB%A7%8C%EB%93%A4%EA%B8%B0-%ED%97%A5%EC%8A%A4%EC%BD%94%EB%93%9C%ED%99%9C%EC%9A%A9


import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
    init(R:Double, G:Double, B:Double){
        self.init(red: R / 255.0, green: G / 255.0, blue: B / 255.0)
    }
}
