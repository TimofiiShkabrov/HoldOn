//
//  BalanceDiagramView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct BalanceDiagramView: View {
    var body: some View {
        HStack {
            Color(.cyan)
        }
        .frame(height: 200)
        .cornerRadius(10)
        .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .padding(18)
    }
}

#Preview {
    BalanceDiagramView()
}
