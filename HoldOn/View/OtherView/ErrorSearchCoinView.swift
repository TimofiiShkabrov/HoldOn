//
//  ErrorSearchCoinView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 7.01.24.
//

import SwiftUI

struct ErrorSearchCoinView: View {
    
    @State var viewModel: CoinsListViewModel
    
    var body: some View {
        ZStack {
            Color("Main")
            Text("No Coins named \"\(viewModel.searchCoin)\" were found")
                .foregroundStyle(Color("TextColor"))
                .font(.subheadline)
                .foregroundStyle(Color("TextColor"))
        }
    }
}
