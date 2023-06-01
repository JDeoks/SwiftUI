//
//  CounterManager.swift
//  SharedIndex
//
//  Created by 서정덕 on 2023/06/01.
//

import Foundation
import Combine
import WatchConnectivity

final class CounterManager: ObservableObject {
    var session: WCSession  // WatchConnectivity 세션 객체
    let delegate: WCSessionDelegate  // WatchConnectivity 세션 델리게이트 객체
    let subject = PassthroughSubject<Int, Never>()  // Int 값을 발행하는 PassthroughSubject 인스턴스
    
    @Published private(set) var count: Int = 0  // 게시된(counted) count 값
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(countSubject: subject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$count)
    }
    
    // count 값을 1 증가시키고 Watch로 메시지를 전송하는 메서드
    func increment() {
        count += 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    // count 값을 1 감소시키고 Watch로 메시지를 전송하는 메서드
    func decrement() {
        count -= 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
}
