//
//  CoinsListSaveManager.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 28.12.23.
//

import Foundation

struct CoinsListSaveManager {
    
    static func saveCoinsList(_ coinsList: [CoinsListModel]) {
        let coinListDictArray = coinsList.map { coinList in
            return [
                "id": coinList.id,
                "symbol": coinList.symbol,
                "name": coinList.name
            ]
        }
        UserDefaults.standard.set(coinListDictArray, forKey: "savedCoinsList")
    }
    
    static func removeSavedCoinsList(completion: @escaping () -> Void) {
            UserDefaults.standard.removeObject(forKey: "savedCoinsList")
            completion()
        }
    
    static func loadCoinsList() -> [CoinsListModel] {
        if let coinListDictArray = UserDefaults.standard.array(forKey: "savedCoinsList") as? [[String: Any]] {
            let decodedCoinsList = coinListDictArray.map { coinListDict in
                return CoinsListModel(
                    id: coinListDict["id"] as? String ?? "",
                    symbol: coinListDict["symbol"] as? String ?? "",
                    name: coinListDict["name"] as? String ?? ""
                )
            }
            return decodedCoinsList
        }
        return []
    }
}
