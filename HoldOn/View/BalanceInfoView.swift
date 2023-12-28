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
                        .foregroundStyle(Color("TextColor"))
                        .font(.subheadline)
                        .bold()
                    Text("\(Date().formatted(date: .long, time: .omitted))")
                        .foregroundStyle(Color("TextColor").opacity(0.5))
                        .font(.caption)
                        .padding(.bottom, 8)
                    HStack {
                        Text("USD $")
                            .foregroundStyle(Color("TextColor"))
                            .font(.subheadline)
                        Text("12,000.55")
                            .foregroundStyle(Color("TextColor"))
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
                        .foregroundStyle(Color("TextColor"))
                        .padding(8)
                        .background(Color("Main"))
                        .frame(width: 42, height: 42)
                        .cornerRadius(10)
                        .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
                        .shadow(color: .black.opacity(0.33), radius: 5, x: 5, y: 5)
                }
            }
            .padding(16)
            .background(Color("Main"))
            .cornerRadius(10)
            .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .padding(18)
    }
}

#Preview {
    BalanceInfoView()
}
