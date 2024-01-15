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
    
    var сoinsList = [CoinsListModel]()
    var selectedCoinsIDs: [SelectedCoinsIDsModel] = []
    
    var searchCoin = ""
    var errorMassage = ""
    var showSearchError = false
    var showError = false
    var isLoadingComplete = false
    var isButtonDisabled = false
    var countdown = 60
    
    func fetchCoinsList() {
        networkManager.fetchCoinsList(from: Link.coinsList.url) { result in
            switch result {
            case .success(let newCoinsList):
                self.сoinsList = newCoinsList
                // Save received coins in UserDefaults
                CoinsListSaveManager.saveCoinsList(newCoinsList)
            case .failure(let error):
                self.errorMassage = warningMassage(error: error)
                self.showError = true
            }
        }
    }
    
    func filterCoinsList() -> [CoinsListModel] {
        let savedCoinsList = CoinsListSaveManager.loadCoinsList()
        
        let filteredList: [CoinsListModel]
        
        if searchCoin.isEmpty {
            filteredList = savedCoinsList
        } else {
            filteredList = savedCoinsList.filter { $0.symbol.uppercased().contains(searchCoin.uppercased()) }
        }
        
        // Check for matches
        if filteredList.isEmpty && !searchCoin.isEmpty {
            showSearchError = true
        } else {
            showSearchError = false
        }
        
        return filteredList
    }
    
    func removeSelectedCoin(coin: CoinsListModel) {
        selectedCoinsIDs.removeAll { $0.id == coin.id }
        saveSelectedCoins()
    }
    
    func addSelectedCoin(coin: CoinsListModel) {
        let selectedCoin = SelectedCoinsIDsModel(id: coin.id)
        selectedCoinsIDs.append(selectedCoin)
        saveSelectedCoins()
    }
    
    private func saveSelectedCoins() {
        let selectedCoinID = selectedCoinsIDs.map { $0.id }
        CoinsIDsSaveManager.saveSelectedCoinIDs(selectedCoinID)
    }
    
    func buttonTapped() {
        isButtonDisabled = true
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.countdown -=  1
            
            if self.countdown <= 0 {
                self.isButtonDisabled = false
                self.countdown = 60
                timer.invalidate()
            }
        }
    }
}
