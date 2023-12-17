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
    
    var url: URL {
        switch self {
        case .coinsList:
            return URL(string: "https://api.coingecko.com/api/v3/coins/list?include_platform=false")!
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
    
    func fetchCoinsList(from url: URL, completion: @escaping(Result<[CoinsList], NetworkError>) -> Void) {
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
    
    private func parseJSONCoinsList(_ data: Data) -> [CoinsList] {
        var coinsList = [CoinsList]()

        if let decoded: [CoinsList] = decode(data) {
            coinsList = decoded
        }
        return coinsList
    }
}
