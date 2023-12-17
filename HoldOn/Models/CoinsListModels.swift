//
//  CoinsListModels.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import Foundation

struct CoinsList: Decodable, Hashable {
    let id, symbol, name: String
}

struct Query: Decodable {
    let status: String
    let data: [CoinsList]
}

extension CoinsList {
    static let example = CoinsList(id: "ocean-protocol", symbol: "ocean", name: "Ocean Protocol")
}
