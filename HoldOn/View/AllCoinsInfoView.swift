//
//  AllCoinsInfoView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct AllCoinsInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Coins by growth")
                .font(.subheadline)
                .padding(.bottom, 8)
            
            VStack {
                ForEach(0 ..< 10, id: \.self) { _ in
                    CoinInfoView()
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    AllCoinsInfoView()
}
