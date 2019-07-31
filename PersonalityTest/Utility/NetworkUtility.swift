//
//  Utility.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Reachability

class NetworkUtility {
    
    static let shared = NetworkUtility()
    
    let reachability = Reachability()!
    
    func setupReachability() {
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func isConnectedToInternet() -> Bool {
        return reachability.connection == .wifi
    }
    
    func stopReachability() {
        reachability.stopNotifier()
    }
}
