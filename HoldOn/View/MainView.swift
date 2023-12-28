//
//  MainView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import SwiftUI

struct MainView: View {
    
    @State var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            VStack {
                
                // Header
                HeaderView(viewModel: viewModel)
                    .sheet(isPresented: $viewModel.showCoinsListView) {
                        CoinsListView()
                    }
                
                Text("Home")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("TextColor"))
                
                ScrollView {
                    // Balance info
                    BalanceInfoView()
                    
                    // Balance diagram
                    BalanceDiagramView()
                    
                    // All coin
                    AllCoinsInfoView()
                    
                    Spacer()
                    
                }
            }
            .padding(8)
        }
        .background(Color("Main"))
    }
}

#Preview {
    MainView()
}
