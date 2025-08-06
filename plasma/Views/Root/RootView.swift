//
//  ContentView.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authChecker = AuthChecker()
    
    private let pokemonService: PokemonServiceProtocol = RestPokemonService()
    private let loginService: LoginServiceProtocol = MockFirebaseLoginService()
    
    init() {
        let authChecker = AuthChecker()
        _authChecker = StateObject(wrappedValue: authChecker)
    }
    
    var body: some View {
        Group {
            if authChecker.isLoggedIn {
                PokemonListView(
                    viewModel: PokemonListViewModel(
                        service: pokemonService
                    )
                )
            } else {
                LoginView(
                    viewModel: LoginViewModel(
                        service: loginService
                    )
                )
            }
        }
        .animation(.easeInOut, value: authChecker.isLoggedIn)
    }
}

#Preview {
    RootView()
}
