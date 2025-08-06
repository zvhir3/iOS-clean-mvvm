//
//  plasmaApp.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//

import SwiftUI
@main
struct plasmaApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                pokemonRepository: RestPokemonRepositoryImpl(),
                loginRepository: FirebaseLoginRepositoryImpl()
            )
        }
    }
}

struct RootView: View {
    @StateObject private var authChecker = AuthChecker()
    
    private let pokemonRepository: PokemonRepository
    private let loginRepository: LoginRepository
    
    init(pokemonRepository: PokemonRepository, loginRepository: LoginRepository) {
        self.pokemonRepository = pokemonRepository
        self.loginRepository = loginRepository
    }
    
    var body: some View {
        Group {
            if authChecker.isLoggedIn {
                PokemonListView(
                    viewModel: PokemonListViewModel(repository: pokemonRepository)
                )
            } else {
                LoginView(
                    viewModel: LoginViewModel(repository: loginRepository)
                )
            }
        }
        .animation(.easeInOut, value: authChecker.isLoggedIn)
    }
}
