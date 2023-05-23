//
//  ContentView.swift
//  NetConnectChecker
//
//  Created by 서정덕 on 2023/05/22.
//

import SwiftUI
import Network

struct ContentView: View {
    @State private var isInternetConnected = true // 인터넷 연결 상태를 나타내는 상태 변수

    var body: some View {
        VStack {
            if isInternetConnected {
                Text("인터넷에 연결되었습니다.")
                    .foregroundColor(.green)
            } else {
                Text("인터넷에 연결되지 않았습니다.")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            checkInternetConnection() // 뷰가 나타날 때 인터넷 연결 상태를 확인하기 위해 checkInternetConnection 함수 호출
        }
    }

    func checkInternetConnection() {
        let monitor = NWPathMonitor() // NWPathMonitor 인스턴스 생성하여 네트워크 경로 모니터링

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied { // 경로 상태가 satisfied인 경우 인터넷 연결됨
                isInternetConnected = true
            } else { // 경로 상태가 satisfied가 아닌 경우 인터넷 연결되지 않음
                isInternetConnected = false
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor") // 모니터링을 위한 디스패치 큐 생성
        monitor.start(queue: queue) // 큐를 사용하여 모니터링 시작
    }

    /// 네트워크 상태 확인하는 함수
    /// 처음 한번만 실행하고 모니터링 캔슬함
    func checkInternetConnectionOnce() {
        // NWPathMonitor 인스턴스 생성하여 네트워크 경로 모니터링
        let monitor = NWPathMonitor()
        // 모니터링을 위한 디스패치 큐 생성
        let queue = DispatchQueue(label: "NetworkMonitor")
        // 초기 네트워크 경로 상태를 확인하고, 그 후 네트워크 경로의 상태가 업데이트될 때 호출되는 클로저
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                // 경로 상태가 satisfied인 경우 인터넷 연결됨
                if path.status == .satisfied {
                    isInternetConnected = true
                } else {
                    isInternetConnected = false
                }
            }
            // 상태 확인 후 모니터링 중지
            monitor.cancel()
        }

        monitor.start(queue: queue)
    }

}
