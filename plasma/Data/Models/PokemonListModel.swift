//
//  PokemonModel.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

struct PokemonListModel: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [NamedAPIResource]
}

struct NamedAPIResource: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let url: String
}
