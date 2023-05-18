//
//  ContentView.swift
//  PostImage
//
//  Created by 서정덕 on 2023/05/18.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage? = UIImage(systemName: "photo") // 저장된 이미지

    func sendImage() {
        guard let image = image else {
            print("이미지가 없습니다.")
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("이미지 데이터를 가져올 수 없습니다.")
            return
        }
        
        // 요청을 보낼 URL 설정
        guard let url = URL(string: "https://example.com/upload") else {
            print("유효하지 않은 URL입니다.")
            return
        }
        
        // 요청 생성
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // 요청에 이미지 데이터 설정
        request.httpBody = imageData
        
        // URLSession을 사용하여 요청 실행
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("에러: \(error)")
                return
            }
            
            // 서버 응답 처리
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("응답: \(responseString)")
                }
            }
        }
        task.resume()
    }

    var body: some View {
        VStack {
            Image(uiImage: image!)
                .resizable()
                .frame(width: 200, height: 200)
            
            Button(action: sendImage) {
                Text("이미지 전송")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
