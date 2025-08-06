//
//  GraphQlPokemonRepositoryImpl.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import Alamofire

class GraphQLPokemonRepositoryImpl: PokemonRepository {
    private let baseUrl = "https://beta.pokeapi.co/graphql/v1beta"

    func fetchPokemonList(limit: Int, offset: Int, completion: @escaping (Result<PokemonListModel, AFError>) -> Void) {
        let query = """
        query PokemonList($limit: Int, $offset: Int) {
          pokemon_v2_pokemon(limit: $limit, offset: $offset) {
            name
            id
          }
        }
        """

        let parameters: [String: Any] = [
            "query": query,
            "variables": ["limit": limit, "offset": offset]
        ]

        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: PokemonListModel.self) { response in
                completion(response.result)
            }
    }

    func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetailsModel, AFError>) -> Void) {
        let query = """
        query PokemonDetail($name: String) {
          pokemon_v2_pokemon(where: {name: {_eq: $name}}) {
            id
            name
            height
            weight
          }
        }
        """

        let parameters: [String: Any] = [
            "query": query,
            "variables": ["name": name]
        ]

        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: PokemonDetailsModel.self) { response in
                completion(response.result)
            }
    }
}
