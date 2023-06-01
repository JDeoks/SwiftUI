//
//  ContentView.swift
//  GetByFBPathMac
//
//  Created by 서정덕 on 2023/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
//            getByFBPath(with: "hiirre") // id 값을 전달하여 get 요청을 보냅니다.
            requestGet()
        }
        .padding()
    }
    
    func getByFBPath(with id: String) {
        //        let baseURLString = "https://port-0-flask-test1-4c7jj2blhexg5l8.sel4.cloudtype.app/"
        //        let queryString = "id=\(id)"
        //
        //        guard let url = URL(string: baseURLString + "?" + queryString) else {
        //            print("Invalid URL")
        //            return
        //        }
        //        print("url: \(url)")
        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //            if let error = error {
        //                print("Error: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            guard let httpResponse = response as? HTTPURLResponse,
        //                  httpResponse.statusCode == 200,
        //                  let responseData = data else {
        //                print("Invalid response")
        //                return
        //            }
        //
        //            do {
        //                let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
        //                print("Error: \(decodedResponse.error)")
        //                print("Info: \(decodedResponse.info)")
        //                print("Summary: \(decodedResponse.summary)")
        //            } catch {
        //                print("Failed to decode response: \(error)")
        //            }
        //        }.resume()
        //        let url = "https://port-0-flask-test1-4c7jj2blhexg5l8.sel4.cloudtype.app/?id=sldkjfh"
        
        
        //        let url = "swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        //        if let apiURI = URL(string: url) {
        //            do {
        //                let apiData = try Data(contentsOf: apiURI)
        //                if let log = String(data: apiData, encoding: .utf8) {
        //                    print(log)
        //                } else {
        //                    print("데이터를 UTF-8 문자열로 디코딩할 수 없습니다.")
        //                }
        //            } catch {
        //                print("오류: \(error)")
        //            }
        //        } else {
        //            print("잘못된 URL: \(url)")
        //        }
        //
        //    }
        
        
        if let url = URL(string: "https://port-0-flask-test1-4c7jj2blhexg5l8.sel4.cloudtype.app/?id=sldkjfh") {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("Response: \(responseString ?? "")")
                }
            }
            task.resume()
        }
    }
    
    func requestGet() {
        // [URL 지정 및 파라미터 값 지정 실시]
        var urlComponents = URLComponents(string: "https://port-0-flask-test1-4c7jj2blhexg5l8.sel4.cloudtype.app/?id=sldkjfh")
//        let paramQuery_1 = URLQueryItem(name: "userId", value: "1")
//        let paramQuery_2 = URLQueryItem(name: "id", value: "1")
//        urlComponents?.queryItems?.append(paramQuery_1) // 파라미터 지정
//        urlComponents?.queryItems?.append(paramQuery_2) // 파라미터 지정
        
        
        // [http 통신 타입 및 헤더 지정 실시]
        var requestURL = URLRequest(url: (urlComponents?.url)!)
        requestURL.httpMethod = "GET" // GET
//        requestURL.addValue("application/x-www-form-urlencoded; charset=utf-8;", forHTTPHeaderField: "Content-Type") // GET

        
        // [http 요쳥을 위한 URLSessionDataTask 생성]
        print("")
        print("====================================")
        print("[requestGet : http get 요청 실시]")
        print("url : ", requestURL)
        print("====================================")
        print("")
        let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in

            // [error가 존재하면 종료]
            guard error == nil else {
                print("")
                print("====================================")
                print("[requestGet : http get 요청 실패]")
                print("fail : ", error?.localizedDescription ?? "")
                print("====================================")
                print("")
                return
            }

            // [status 코드 체크 실시]
            let successsRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, successsRange.contains(statusCode)
            else {
                print("")
                print("====================================")
                print("[requestGet : http get 요청 에러]")
                print("error : ", (response as? HTTPURLResponse)?.statusCode ?? 0)
                print("msg : ", (response as? HTTPURLResponse)?.description ?? "")
                print("====================================")
                print("")
                return
            }

            // [response 데이터 획득, utf8인코딩을 통해 string형태로 변환]
            let resultCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            let resultLen = data! // 데이터 길이
            let resultString = String(data: resultLen, encoding: .utf8) ?? "" // 응답 메시지
            print("")
            print("====================================")
            print("[requestGet : http get 요청 성공]")
            print("resultCode : ", resultCode)
            print("resultLen : ", resultLen)
            print("resultString : ", resultString)
            print("====================================")
            print("")
        }

        // network 통신 실행
        dataTask.resume()
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




