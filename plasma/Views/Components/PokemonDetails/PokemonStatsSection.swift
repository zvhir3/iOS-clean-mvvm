//
//  PokemonStatsSection.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonStatsSection: View {
    let pokemon: PokemonDetailsModel
    
    var body: some View {
        if let stats = pokemon.stats {
            SectionCard(title: "Base Stats", icon: "chart.bar.fill") {
                VStack(spacing: 16) {
                    ForEach(stats, id: \.stat?.name) { stat in
                        if let name = stat.stat?.name, let value = stat.baseStat {
                            StatRow(name: name, value: value, maxValue: 255)
                        }
                    }
                }
            }
        }
    }
}
