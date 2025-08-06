//
//  PokemonDetailsViewModel.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import Foundation

class PokemonDetailsViewModel: ObservableObject {
    @Published var details: PokemonDetailsModel?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func fetchPokemonDetails(name: String) {
        isLoading = true
        errorMessage = nil

        repository.fetchPokemonDetail(name: name) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false

                switch result {
                case .success(let response):
                    self.details = response
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
