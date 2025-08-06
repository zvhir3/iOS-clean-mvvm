//
//  PokemonRow.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonRow: View {
    let pokemon: NamedAPIResource
    let service: PokemonServiceProtocol

    var body: some View {
        NavigationLink(
            destination: PokemonDetailsView(
                viewModel: PokemonDetailsViewModel(service: service),
                pokemonName: pokemon.name
            )
        ) {
            Text(pokemon.name.capitalized)
        }
    }
}
