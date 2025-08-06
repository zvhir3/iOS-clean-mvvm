//
//  PokemonDetailsView.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI
import SwiftUI

struct PokemonDetailsView: View {
    @StateObject var viewModel: PokemonDetailsViewModel
    let pokemonName: String
    
    var body: some View {
        ScrollView {
            if let pokemon = viewModel.details {
                LazyVStack(spacing: 24) {
                    PokemonHeaderSection(pokemon: pokemon)
                    PokemonTypesSection(pokemon: pokemon)
                    PokemonStatsSection(pokemon: pokemon)
                    PokemonAbilitiesSection(pokemon: pokemon)
                    PokemonMovesSection(pokemon: pokemon)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            } else if viewModel.isLoading {
                LoadingView(pokemonName: pokemonName)
            } else if let error = viewModel.errorMessage {
                ErrorView(error: error)
            }
        }
        .background(
            LinearGradient(
                colors: [Color(.systemBackground), Color(.systemGray6)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchPokemonDetails(name: pokemonName)
        }
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil), actions: {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        }, message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        })
    }
}
