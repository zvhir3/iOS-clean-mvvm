//
//  PokemonTypeSection.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonTypesSection: View {
    let pokemon: PokemonDetailsModel
    
    var body: some View {
        if let types = pokemon.types {
            SectionCard(title: "Types", icon: "tag.fill") {
                HStack(spacing: 12) {
                    ForEach(types, id: \.slot) { typeEntry in
                        if let typeName = typeEntry.type?.name {
                            TypeBadge(typeName: typeName)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
