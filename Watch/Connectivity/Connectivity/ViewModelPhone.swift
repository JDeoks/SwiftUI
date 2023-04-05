//
//  ViewModelPhone.swift
//  Connectivity
//
//  Created by 서정덕 on 2023/04/06.
//


import Foundation
import WatchConnectivity


class ViewModelPhone : NSObject,  WCSessionDelegate{
    
    var session: WCSession
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
}
