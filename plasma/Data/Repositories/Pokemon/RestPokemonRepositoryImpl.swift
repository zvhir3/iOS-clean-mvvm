//
//  RestPokemonRepoImpl.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import Alamofire

class RestPokemonRepositoryImpl: PokemonRepository {
    private let baseUrl = "https://pokeapi.co/api/v2/pokemon"

    func fetchPokemonList(limit: Int = 20, offset: Int = 0, completion: @escaping (Result<PokemonListModel, AFError>) -> Void) {
        let parameters: Parameters = ["limit": limit, "offset": offset]

        AF.request(baseUrl, parameters: parameters)
            .validate()
            .responseDecodable(of: PokemonListModel.self) { response in
                completion(response.result)
            }
    }
    
    func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetailsModel, AFError>) -> Void) {
        let url = "\(baseUrl)/\(name)"
        AF.request(url)
            .validate()
            .responseDecodable(of: PokemonDetailsModel.self) { response in
                completion(response.result)
            }
    }
}
