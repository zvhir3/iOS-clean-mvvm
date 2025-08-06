//
//  LoadingRow.swift
//  plasma
//
//  Created by Luminous Latte on 06/08/2025.
//

import SwiftUI

struct LoadingRow: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView("Loading more...")
            Spacer()
        }
    }
}
