//
//  ViewModelWatch.swift
//  CounterConnect Watch App
//
//  Created by 서정덕 on 2023/04/06.
//

import Foundation
import WatchConnectivity

class ViewModelWatch : NSObject,  WCSessionDelegate, ObservableObject {
    var session: WCSession
    // 초기값
    @Published var messageText = ""
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    /// Watch로부터 메시지를 받으면, 해당 메시지에 담긴 "message"라는 key를 가진 문자열을 ViewModelWatch의 messageText 프로퍼티에 할당합니다. 만약 메시지에 "message" key가 없으면 "" 문자열을 messageText에 할당합니다.
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageText = message["message"] as? String ?? ""
        }
    }
    
}
