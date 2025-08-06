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
    
    private let service: LoginServiceProtocol
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func login(completion: @escaping (Result<Void, Error>) -> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and Password must not be empty."
            completion(.failure(LoginError.emptyFields))
            return
        }
        
        errorMessage = nil
        isLoading = true
        
        service.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error))
                }
            }
        }
    }
    
    enum LoginError: LocalizedError {
        case emptyFields
        
        var errorDescription: String? {
            switch self {
            case .emptyFields:
                return "Email and Password must not be empty."
            }
        }
    }
    
    func reset() {
        email = ""
        password = ""
        errorMessage = nil
        isLoading = false
    }
}
