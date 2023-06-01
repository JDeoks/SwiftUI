//
//  SessionDelegater.swift
//  SharedIndex
//
//  Created by 서정덕 on 2023/06/01.
//

import Foundation
import Combine
import WatchConnectivity

class SessionDelegater: NSObject, WCSessionDelegate {
    let countSubject: PassthroughSubject<Int, Never>
    
    init(countSubject: PassthroughSubject<Int, Never>) {
        self.countSubject = countSubject
        super.init()
    }
    
    // MARK: - WCSessionDelegate Methods
    
    // WatchConnectivity 세션의 활성화가 완료될 때 호출되는 메서드입니다.
    // 이 데모에서는 해당 메서드를 구현할 필요가 없습니다.
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    // WatchConnectivity 세션으로부터 메시지를 받을 때 호출되는 메서드입니다.
    // 받은 메시지에서 "count" 값을 추출하여 countSubject를 통해 전달합니다.
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let count = message["count"] as? Int {
                self.countSubject.send(count)
            } else {
                print("There was an error")
            }
        }
    }
    
    // MARK: - iOS Protocol Conformance
    
    // iOS 전용 프로토콜 구현
    // 이 데모에서는 사용하지 않으며 iOS 앱에서만 필요한 부분입니다.
    #if os(iOS)
    
    // WatchConnectivity 세션이 비활성 상태로 전환되었을 때 호출되는 메서드입니다.
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    // WatchConnectivity 세션이 비활성 상태로 전환된 후 호출되는 메서드입니다.
    // 새로운 워치로 전환한 후에 세션을 다시 활성화합니다.
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    
    // WatchConnectivity 세션의 상태가 변경되었을 때 호출되는 메서드입니다.
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    #endif

}
