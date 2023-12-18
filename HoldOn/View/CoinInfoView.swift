//
//  CoinInfoView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct CoinInfoView: View {
    var body: some View {
        HStack {
            // Icon coin
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(8)
                .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
                .frame(width: 42, height: 42)
                .cornerRadius(10)
                .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            
            // Coin name
            VStack(alignment: .leading) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("btc".uppercased())
                    .font(.caption)
                    .padding(.leading, 5)
            }
            
            Spacer()
            
            // Coin price
            VStack(alignment: .trailing) {
                Text("39,000.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("3.2%")
                    .font(.caption)
                    .foregroundStyle(Color.green)
            }
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    CoinInfoView()
}
