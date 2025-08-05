//
//  ContentView.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authChecker = AuthChecker()
    @StateObject private var loginViewModel: LoginViewModel
    
    init() {
        let authChecker = AuthChecker()
        _authChecker = StateObject(wrappedValue: authChecker)
        _loginViewModel = StateObject(
            wrappedValue: LoginViewModel(
                authService: MockFirebaseLoginService(),
                authChecker: authChecker
            )
        )
    }
    
    var body: some View {
        Group {
            if authChecker.isLoggedIn {
                HomeView()
            } else {
                LoginView(viewModel: loginViewModel)
            }
        }
        .animation(.easeInOut, value: authChecker.isLoggedIn)
    }
}

#Preview {
    RootView()
}
