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
                            
                            Spacer()
                            
                            Button {
                                CoinsListSaveManager.removeSavedCoinsList {
                                    viewModel.fetchCoinsList()
                                }
                            } label: {
                                Image(systemName: "arrow.triangle.2.circlepath")
                            }
                        }
                        .foregroundStyle(Color("TextColor"))
                        .padding(.bottom, 8)
                        
                        TextField("Enter Coin name", text: $viewModel.searchCoin)
                            .padding(8)
                            .background(Color("MainColorDark").opacity(0.2))
                            .foregroundStyle(Color("TextColorDark"))
                            .cornerRadius(8)
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                        
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
                            .listRowBackground(Color.clear)
                            .foregroundStyle(Color("TextColor"))
                        }
                        .listStyle(.plain)
                        
                        .cornerRadius(8)
                        
                        Button {
                            print(viewModel.selectedCoins)
                        } label: {
                            Text("Save")
                        }
                    }
                }
                .padding(16)
                .background(Color("MainColor"))
                
            }
        }
        .ignoresSafeArea()
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
