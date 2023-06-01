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
    static let shared = SessionDelegater()
    
    let countSubject = PassthroughSubject<Int, Never>()
    let messageSubject = PassthroughSubject<String, Never>()
    
    private override init() {
        super.init()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Protocol conformance only
        // Not needed for this demo
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let count = message["count"] as? Int {
                self.countSubject.send(count)
            } else {
                print("There was an error (count)")
            }
            if let message = message["message"] as? String {
                self.messageSubject.send(message)
            } else {
                print("There was an error (message)")
            }
        }
    }
    
    #if os(iOS)
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    #endif
}

