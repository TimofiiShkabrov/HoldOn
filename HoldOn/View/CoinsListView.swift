//
//  CoinsListView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct CoinsListView: View {
    
    @StateObject var networkManager = NetworkManager.shared
    
    @State private var coinsList = [CoinsList]()
    
    @State private var errorMassage = ""
    @State private var showError = false
    
    var body: some View {
        ZStack {
            VStack {
                List(coinsList, id: \.self) { coinsList in
                    HStack {
                        Text(coinsList.symbol.uppercased())
                        
                        Spacer()
                        
                        Text(coinsList.name)
                    }
                }
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text(errorMassage), dismissButton: .default(Text("OK")))
        }
        .task {
            networkManager.fetchCoinsList(from: Link.coinsList.url) { result in
                switch result {
                case .success(let newCoinsList):
                    self.coinsList = newCoinsList
                case .failure(let error):
                    self.errorMassage = warningMassage(error: error)
                    self.showError = true
                }
            }
        }
    }
}

#Preview {
    CoinsListView()
}
