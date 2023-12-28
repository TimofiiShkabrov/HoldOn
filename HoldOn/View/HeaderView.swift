//
//  HeaderView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct HeaderView: View {
    
    @State var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("HoldOn")
                    .foregroundStyle(Color("TextColor"))
                    .font(.title)
                    .bold()

                Spacer()
                
                Button {
                    viewModel.showCoinsListView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("TextColor"))
                        .padding(8)
                        .background(Color("MainColor"))
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

