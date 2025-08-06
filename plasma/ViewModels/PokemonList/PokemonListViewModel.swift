//
//  HomeViewModel.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [NamedAPIResource] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    let service: PokemonServiceProtocol
    private var offset = 0
    private let limit = 20
    private var canLoadMore = true

    init(service: PokemonServiceProtocol) {
        self.service = service
        fetchPokemonList()
    }

    func fetchPokemonList() {
        guard !isLoading, canLoadMore else { return }

        isLoading = true
        errorMessage = nil

        service.fetchPokemonList(limit: limit, offset: offset) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false

                switch result {
                case .success(let response):
                    if response.results.isEmpty {
                        self.canLoadMore = false
                    } else {
                        self.pokemons.append(contentsOf: response.results)
                        self.offset += self.limit
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
