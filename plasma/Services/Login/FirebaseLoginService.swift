//
//  FirebaseLoginService.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import FirebaseAuth

class MockFirebaseLoginService: LoginServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if email == "user@gmail.com" && password == "user123" {
                let user = UserModel(id: 1, name: "Test User", email: email)
                completion(.success(user))
            } else {
                let error = NSError(domain: "MockAuth", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
                completion(.failure(error))
            }
        }
    }
}
