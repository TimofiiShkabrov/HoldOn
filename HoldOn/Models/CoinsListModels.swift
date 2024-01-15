//
//  CoinsListModels.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import Foundation

struct CoinsListModel: Decodable, Hashable {
    let id, symbol, name: String
}

struct Query: Decodable {
    let status: String
    let data: [CoinsListModel]
}

extension CoinsListModel {
    static let example = CoinsListModel(id: "ocean-protocol", symbol: "ocean", name: "Ocean Protocol")
}
