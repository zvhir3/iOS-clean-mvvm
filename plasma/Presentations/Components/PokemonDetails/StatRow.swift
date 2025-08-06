//
//  StatRow.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//
import SwiftUI

struct StatRow: View {
    let name: String
    let value: Int
    let maxValue: Int
    
    private var normalizedValue: Double {
        Double(value) / Double(maxValue)
    }
    
    private var statColor: Color {
        switch normalizedValue {
        case 0.8...: return .green
        case 0.6..<0.8: return .yellow
        case 0.4..<0.6: return .orange
        default: return .red
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(name.capitalized)
                    .font(.system(.body, design: .rounded, weight: .medium))
                    .frame(width: 120, alignment: .leading)
                
                Spacer()
                
                Text("\(value)")
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(statColor)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemGray5))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [statColor.opacity(0.7), statColor],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * normalizedValue, height: 8)
                        .animation(.easeInOut(duration: 0.8), value: normalizedValue)
                }
            }
            .frame(height: 8)
        }
    }
}
