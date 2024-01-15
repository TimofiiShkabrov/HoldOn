//
//  NetworkManager.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import Foundation
import Alamofire

enum Link {
    case coinsList
    case userCoinsList
    
    var url: URL {
        switch self {
        case .coinsList:
            return URL(string: "https://api.coingecko.com/api/v3/coins/list?include_platform=false")!
        case .userCoinsList:
            return URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=ethereum%2Cbitcoin&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")!
        }
    }
}

enum NetworkError: Error {
    case tooManyRequests
    case noData
    case decodingError
}

final class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCoinsList(from url: URL, completion: @escaping(Result<[CoinsListModel], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let correctData):
                    let coinsList = self.parseJSONCoinsList(correctData)
                    completion(.success(coinsList))
                case .failure(let afError):
                    print("AF error: \(afError.localizedDescription)")
                    if responseData.response?.statusCode == 429 {
                        completion(.failure(.tooManyRequests))
                    } else {
                        completion(.failure(.noData))
                    }
                }
            }
    }
    
    private func parseJSONCoinsList(_ data: Data) -> [CoinsListModel] {
        var coinsList = [CoinsListModel]()

        if let decoded: [CoinsListModel] = decode(data) {
            coinsList = decoded
        }
        return coinsList
    }
    
    func fetchUserCoinsList(from url: URL, completion: @escaping(Result<[CoinsListModel], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { responseData in
                switch responseData.result{
                    case .success(let correctData):
                    let userCoinsList = self.parseJSONUserCoinsList(correctData)
                    completion(.success(userCoinsList))
                case .failure(let afError):
                    print("AF error: \(afError.localizedDescription)")
                    if responseData.response?.statusCode == 429 {
                        completion(.failure(.tooManyRequests))
                    } else {
                        completion(.failure(.noData))
                    }
                }
            }
    }
    
    private func parseJSONUserCoinsList(_ data: Data) -> [CoinsListModel] {
        var userCoinsList = [CoinsListModel]()

        if let decoded: [CoinsListModel] = decode(data) {
            userCoinsList = decoded
        }
        return userCoinsList
    }
}
