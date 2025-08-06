//
//  LoginRepository.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//
protocol LoginRepository {
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}
