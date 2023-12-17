//
//  ErrorHelper.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import Foundation


func warningMassage(error: NetworkError) -> String {
    switch error {
    case .tooManyRequests:
        return "Too many requests"
    case .noData:
        return "No data"
    case .decodingError:
        return "Decoding error"
    }
}
