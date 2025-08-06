//
//  PokemonHeaderSection.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct PokemonHeaderSection: View {
    let pokemon: PokemonDetailsModel
    
    var body: some View {
        VStack(spacing: 16) {
            if let urlString = pokemon.sprites?.other?.officialArtwork?.frontDefault,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray5))
                        .frame(height: 250)
                        .overlay { ProgressView().scaleEffect(1.5) }
                }
            }
            
            VStack(spacing: 12) {
                Text((pokemon.name ?? "Unknown").capitalized)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                
                HStack(spacing: 20) {
                    if let id = pokemon.id {
                        InfoPill(title: "ID", value: "#\(String(format: "%03d", id))")
                    }
                    if let h = pokemon.height {
                        InfoPill(title: "Height", value: String(format: "%.1f m", Double(h) / 10.0))
                    }
                    if let w = pokemon.weight {
                        InfoPill(title: "Weight", value: String(format: "%.1f kg", Double(w) / 10.0))
                    }
                }

                if let exp = pokemon.baseExperience {
                    InfoPill(title: "Base Experience", value: "\(exp)")
                }
            }
        }
        .padding(.top, 20)
    }
}
