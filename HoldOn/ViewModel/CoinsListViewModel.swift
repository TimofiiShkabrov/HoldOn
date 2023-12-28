//
//  CoinsListViewModel.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 27.12.23.
//

import Foundation
import Observation

@Observable
class CoinsListViewModel {
    
    var networkManager = NetworkManager.shared
    
    var сoinsList = [CoinsList]()
    var searchCoin = ""
    var showError = false
    var errorMassage = ""
    var selectedCoins: [CoinsList] = []
    var isLoadingComplete = false
    
    func fetchCoinsList() {
        networkManager.fetchCoinsList(from: Link.coinsList.url) { result in
            switch result {
            case .success(let newCoinsList):
                self.сoinsList = newCoinsList
                CoinsListSaveManager.saveCoinsList(newCoinsList) // Сохраняем полученные монеты в UserDefaults
            case .failure(let error):
                self.errorMassage = warningMassage(error: error)
                self.showError = true
            }
        }
    }
    
    func filterCoinsList() -> [CoinsList] {
        let savedCoinsList = CoinsListSaveManager.loadCoinsList()

        if searchCoin.isEmpty {
            return savedCoinsList.isEmpty ? сoinsList : savedCoinsList
        } else {
            return savedCoinsList.isEmpty ? сoinsList.filter { $0.symbol.uppercased().contains(searchCoin.uppercased()) } : savedCoinsList.filter { $0.symbol.uppercased().contains(searchCoin.uppercased()) }
        }
    }

    
    func addSelectedCoin(coin: CoinsList) {
        selectedCoins.append(coin)
    }
}
