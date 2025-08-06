//
//  TypeBadge.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct TypeBadge: View {
    let typeName: String
    
    var typeColor: Color {
        switch typeName.lowercased() {
        case "fire": return .red
        case "water": return .blue
        case "grass": return .green
        case "electric": return .yellow
        case "psychic": return .pink
        case "ice": return .cyan
        case "dragon": return .purple
        case "dark": return .black
        case "fighting": return .orange
        case "poison": return Color(red: 0.6, green: 0.4, blue: 0.8)
        case "ground": return .brown
        case "flying": return Color(red: 0.7, green: 0.8, blue: 1.0)
        case "bug": return Color(red: 0.7, green: 0.8, blue: 0.3)
        case "rock": return Color(red: 0.7, green: 0.6, blue: 0.4)
        case "ghost": return Color(red: 0.4, green: 0.3, blue: 0.6)
        case "steel": return .gray
        case "fairy": return Color(red: 1.0, green: 0.7, blue: 0.8)
        default: return .gray
        }
    }
    
    var body: some View {
        Text(typeName.capitalized)
            .font(.system(.callout, design: .rounded, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                LinearGradient(
                    colors: [typeColor, typeColor.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .shadow(color: typeColor.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}
