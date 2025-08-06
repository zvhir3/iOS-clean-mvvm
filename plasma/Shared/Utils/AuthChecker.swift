//
//  AuthChecker.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import Foundation
import Combine

class AuthChecker: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn") {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    func setLoggedIn(_ loggedIn: Bool) {
        isLoggedIn = loggedIn
    }
}
