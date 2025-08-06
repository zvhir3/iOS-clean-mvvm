//
//  PokemonAbilitiesSection.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonAbilitiesSection: View {
    let pokemon: PokemonDetailsModel
    
    var body: some View {
        if let abilities = pokemon.abilities {
            SectionCard(title: "Abilities", icon: "star.fill") {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(abilities, id: \.slot) { abilityEntry in
                        HStack {
                            Text((abilityEntry.ability?.name ?? "Unknown").capitalized)
                                .font(.system(.body, design: .rounded, weight: .medium))
                            
                            if abilityEntry.isHidden == true {
                                Text("Hidden")
                                    .font(.caption)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.orange.opacity(0.2))
                                    .foregroundColor(.orange)
                                    .cornerRadius(8)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
    }
}
