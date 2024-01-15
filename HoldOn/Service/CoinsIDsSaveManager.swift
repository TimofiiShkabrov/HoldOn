//
//  CoinsIDsSaveManager.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 29.12.23.
//

import Foundation

struct CoinsIDsSaveManager {
    
        static func saveSelectedCoinIDs(_ coinIDs: [String]) {
            UserDefaults.standard.set(coinIDs, forKey: "selectedCoinIDs")
        }

        static func loadSelectedCoinIDs() -> [String] {
            return UserDefaults.standard.stringArray(forKey: "selectedCoinIDs") ?? []
        }
}
