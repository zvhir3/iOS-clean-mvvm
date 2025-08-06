//
//  LoginView.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)

            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    viewModel.login { result in
                        switch result {
                        case .success:
                            print("✅ Login success")
                            // later: trigger AuthChecker.setLoggedIn(true) here
                        case .failure(let error):
                            print("❌ Login failed: \(error.localizedDescription)")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
