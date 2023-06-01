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
    static let shared = CounterManager()
    
    private var session: WCSession
    
    @Published private(set) var count: Int = 0
    
    private init(session: WCSession = .default) {
        self.session = session
        self.session.delegate = SessionDelegater.shared
        self.session.activate()
        
        SessionDelegater.shared.countSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$count)
    }
    
    func increaseCount() {
        count += 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func decreaseCount() {
        count -= 1
        session.sendMessage(["count": count], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
}
