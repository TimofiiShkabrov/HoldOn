//
//  CoinsListView.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 18.12.23.
//

import SwiftUI

struct CoinsListView: View {
    
    @StateObject var networkManager = NetworkManager.shared
    @State var viewModel = CoinsListViewModel()
    
    @State var isSelected = false
    
    var body: some View {
        ZStack {
            if viewModel.filterCoinsList().isEmpty {
                LoadingView()
                    .onAppear {
                        viewModel.fetchCoinsList()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.isLoadingComplete = true
                        }
                    }
                    .opacity(viewModel.isLoadingComplete ? 0 : 1)
            } else {
                ZStack {
                    VStack {
                        SwipeButtonView()
                        HStack {
                            Button {
                                CoinsListSaveManager.removeSavedCoinsList {
                                    viewModel.fetchCoinsList()
                                }
                            } label: {
                                Image(systemName: "arrow.triangle.2.circlepath")
                            }
                        }
                        TextField("Enter Coin name", text: $viewModel.searchCoin)
                            .foregroundStyle(Color("TextColor"))
                            .padding(.horizontal, 24)
                        
                        List(viewModel.filterCoinsList(), id: \.self) { coinsList in
                            HStack {
                                Text(coinsList.symbol.uppercased())
                                
                                Spacer()
                                
                                Text(coinsList.name)
                                    .onTapGesture {
                                        self.isSelected = !self.isSelected
                                        if self.isSelected {
                                            self.viewModel.addSelectedCoin(coin: coinsList)
                                        }
                                    }
                                    .foregroundColor(self.isSelected ? .green : .none)
                            }
                            .foregroundStyle(Color("TextColor"))
                        }
                        .background(Color("Main"))
                        
                        Button {
                            print(viewModel.selectedCoins)
                        } label: {
                            Text("Save")
                        }
                    }
                }
                .padding(16)
                .background(Color("Main"))
                
            }
        }
        .task {
            if viewModel.filterCoinsList().isEmpty {
                viewModel.fetchCoinsList()
            }
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMassage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CoinsListView()
}
