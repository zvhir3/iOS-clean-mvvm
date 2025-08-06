//
//  PokemonListRepository.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import Alamofire

protocol PokemonRepository {
    func fetchPokemonList(limit: Int, offset: Int, completion: @escaping (Result<PokemonListModel, AFError>) -> Void)
    func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetailsModel, AFError>) -> Void)
}
