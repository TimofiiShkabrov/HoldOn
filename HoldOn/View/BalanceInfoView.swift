//
//  BalanceInfoView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct BalanceInfoView: View {
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("Balance")
                        .font(.subheadline)
                        .bold()
                    Text("\(Date().formatted(date: .long, time: .omitted))")
                        .font(.caption)
                        .foregroundStyle(Color.white.opacity(0.5))
                        .padding(.bottom, 8)
                    HStack {
                        Text("USD $")
                            .font(.subheadline)
                        Text("12,000.55")
                            .font(.title)
                            .bold()
                    }
                }
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white)
                        .padding(8)
                        .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
                        .frame(width: 42, height: 42)
                        .cornerRadius(10)
                        .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
                        .shadow(color: .black.opacity(0.33), radius: 5, x: 5, y: 5)
                }
            }
            .padding(16)
            .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
            .cornerRadius(10)
            .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .padding(18)
    }
}

#Preview {
    BalanceInfoView()
}
