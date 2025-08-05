//
//  LoginViewModel.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var user: UserModel? = nil
    
    private let authService: LoginServiceProtocol
    private let authChecker: AuthChecker
    
    init(authService: LoginServiceProtocol, authChecker: AuthChecker) {
        self.authService = authService
        self.authChecker = authChecker
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and Password must not be empty."
            return
        }
        
        errorMessage = nil
        isLoading = true
        
        authService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.user = user
                    self?.authChecker.setLoggedIn(true)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func logout() {
        authChecker.setLoggedIn(false)
        user = nil
        email = ""
        password = ""
    }
}
