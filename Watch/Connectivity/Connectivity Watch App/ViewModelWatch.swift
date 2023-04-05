//
//  ViewModelWatch.swift
//  Connectivity Watch App
//
//  Created by 서정덕 on 2023/04/06.
//


import Foundation
import WatchConnectivity

class ViewModelWatch : NSObject,  WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var messageText = ""
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageText = message["message"] as? String ?? "Unknown"
        }
    }
}
