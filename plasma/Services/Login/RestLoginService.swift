//
//  AlamofireService.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import Foundation
import Alamofire

class MockRestLoginService: LoginServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if email == "user@gmail.com" && password == "user123" {
                let user = UserModel(id: 42, name: "Mock User", email: email)
                completion(.success(user))
            } else {
                let error = NSError(domain: "MockAlamofireAuth", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])
                completion(.failure(error))
            }
        }
    }
}
