//
//  HeaderView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .shadow(color: .white, radius: 5)
                Text("HoldOn")
                    .font(.title)
                    .bold()

                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white)
                        .padding(8)
                        .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
                        .frame(width: 42, height: 42)
                        .cornerRadius(10)
                        .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    HeaderView()
}
