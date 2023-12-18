//
//  MainView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            VStack {
                
                // Header
                HeaderView()
                
                Text("Home")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                
                ScrollView {
                    // Balance info
                    BalanceInfoView()
                    
                    // Balance diagram
                    BalanceDiagramView()
                    
                    // All coin
                    AllCoinsInfoView()
                    
                    // Footer button
                    FooterButton()
                    
                    Spacer()
                    
                }
            }
            .padding(8)
        }
        .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
    }
}

struct FooterButton: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("All coins")
                    .foregroundStyle(Color.white)
                    .padding(8)
                    .background(Color(#colorLiteral(red: 0.3881825805, green: 0.1972106695, blue: 0.7583934665, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: .white.opacity(0.4), radius: 5, x: -3, y: -3)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            }
        }
        .padding(18)
    }
}

#Preview {
    MainView()
}
