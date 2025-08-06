//
//  PokemonMovesSection.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonMovesSection: View {
    let pokemon: PokemonDetailsModel
    
    var body: some View {
        if let moves = pokemon.moves {
            SectionCard(title: "Moves", icon: "bolt.fill") {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(moves.prefix(10), id: \.move?.name) { moveEntry in
                        if let moveName = moveEntry.move?.name {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(moveName.capitalized)
                                    .font(.system(.headline, design: .rounded, weight: .semibold))
                                
                                if let details = moveEntry.versionGroupDetails {
                                    ForEach(details.prefix(2), id: \.versionGroup?.name) { detail in
                                        if let method = detail.moveLearnMethod?.name,
                                           let version = detail.versionGroup?.name {
                                            HStack {
                                                Image(systemName: "circle.fill")
                                                    .font(.system(size: 6))
                                                    .foregroundColor(.secondary)
                                                
                                                Text("\(method.capitalized) in \(version.capitalized)")
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                            
                            if moveName != moves.prefix(10).last?.move?.name {
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
}
