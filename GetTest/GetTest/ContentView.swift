//
//  ContentView.swift
//  GetTest
//
//  Created by 서정덕 on 2023/05/28.
//

import SwiftUI

struct ContentView: View {
    @State var getReqError: String = ""
    @State var getReqInfo: String = ""
    @State var getReqSummary: String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("getReqError: \(getReqError)")
            Text("getReqInfo: \(getReqInfo)")
            Text("getReqSummary: \(getReqSummary)")
        }
        .onAppear {
            getByPath(path: "Original/1/BA71F813-4956-4F47-8682-5E74420FC078/D8F4FD17-6AB1-460D-BC04-A9B8449352A8.jpg")
        }
        .padding()
    }
    
    func getByPath(path: String) {
        var urlComponents = URLComponents(string: "https://port-0-flask-test1-4c7jj2blhexg5l8.sel4.cloudtype.app/")
        urlComponents?.queryItems = [URLQueryItem(name: "id", value: path)]
        
        if let url = urlComponents?.url {
            let request = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("HTTP GET 요청 실패. 에러: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("유효하지 않은 HTTP 응답")
                    return
                }
                
                if (200..<300).contains(httpResponse.statusCode) {
                    if let responseData = data {
                        if let resultString = String(data: responseData, encoding: .utf8) {
                            print("HTTP GET 요청 성공")
                            print("상태 코드: \(httpResponse.statusCode)")
                            print("응답 데이터: \(resultString)")
                            
                            // JSON 디코딩
                            do {
                                let decoder = JSONDecoder()
                                let responseData = try decoder.decode(ResponseData.self, from: responseData)
                                getReqError = responseData.error
                                getReqInfo = responseData.info
                                getReqSummary = responseData.summary
                                
                                // 사용할 데이터를 처리하거나 UI에 반영하는 로직 추가
                                // 예: DispatchQueue.main.async { ... }
                            } catch {
                                print("JSON 디코딩 실패. Error: \(error)")
                            }
                        }
                    }
                } else {
                    print("HTTP GET 요청 에러. 상태 코드: \(httpResponse.statusCode)")
                }
            }
            dataTask.resume()
        } else {
            print("유효하지 않은 URL")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ResponseData: Codable {
    let error: String
    let info: String
    let summary: String
}

