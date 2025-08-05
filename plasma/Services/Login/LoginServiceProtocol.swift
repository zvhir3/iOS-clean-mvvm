//
//  AuthServiceProtocol.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

protocol LoginServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}
