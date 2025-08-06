//
//  PokemonListView.swift
//  plasma
//
//  Created by NightfallNest on 05/08/2025.
//
import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.pokemons, id: \.name) { pokemon in
                    PokemonRow(
                        pokemon: pokemon,
                        service: viewModel.service
                    )
                    .onAppear {
                        if pokemon.name == viewModel.pokemons.last?.name {
                            viewModel.fetchPokemonList()
                        }
                    }
                }

                if viewModel.isLoading {
                    LoadingRow()
                }
            }
            .navigationTitle("Pokémon")
            .overlay(
                Group {
                    if let error = viewModel.errorMessage {
                        ErrorView(error: error)
                    }
                }
            )
        }
    }
}
