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
    
    var body: some View {
        ZStack {
            if viewModel.filterCoinsList().isEmpty && viewModel.searchCoin.isEmpty {
                LoadingView()
                    .onAppear {
                        viewModel.fetchCoinsList()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.isLoadingComplete = true
                            viewModel.buttonTapped()
                        }
                    }
                    .opacity(viewModel.isLoadingComplete ? 0 : 1)
            } else {
                ZStack {
                    VStack {
                        SwipeButtonView()
                        
                        HStack {
                            
                            Spacer()
                            
                            if viewModel.isButtonDisabled {
                                Text("\(viewModel.countdown)")
                                    .foregroundStyle(Color("TextColor").opacity(0.6))
                                    .font(.subheadline)
                            } else {
                                Text("Update list of Coins")
                                    .foregroundStyle(Color("TextColor").opacity(0.6))
                                    .font(.subheadline)
                            }
                            Button {
                                CoinsListSaveManager.removeSavedCoinsList {
                                    viewModel.fetchCoinsList()
                                    viewModel.buttonTapped()
                                }
                            } label: {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundStyle(Color.accentColor)
                            }
                            .disabled(viewModel.isButtonDisabled)
                        }
                        .foregroundStyle(Color("TextColor"))
                        .padding(.bottom, 8)
                        .padding(.horizontal, 8)
                        
                        TextField("Enter Coin name", text: $viewModel.searchCoin)
                            .padding(8)
                            .background(Color("MainColorDark").opacity(0.2))
                            .foregroundStyle(Color("TextColorDark"))
                            .cornerRadius(8)
                            .padding(.horizontal, 8)
                            .padding(.bottom, 8)
                        
                        if viewModel.filterCoinsList().isEmpty {
                            ErrorSearchCoinView(viewModel: viewModel)
                        } else {
                            List(viewModel.filterCoinsList(), id: \.self) { coinsList in
                                HStack {
                                    Text(coinsList.symbol.uppercased())
                                    Spacer()
                                    Text(coinsList.name)
                                }
                                .listRowBackground(Color.clear)
                                .foregroundStyle(Color("TextColor"))
                            }
                            .listStyle(.plain)
                            .cornerRadius(8)
                            
                            Button {
                                //
                            } label: {
                                Text("Save")
                            }
                        }
                    }
                }
                .padding(16)
                .background(Color("MainColor"))
            }
        }
        .ignoresSafeArea()
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
