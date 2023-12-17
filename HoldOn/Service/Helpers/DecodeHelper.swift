//
//  DecodeHelper.swift
//  HoldOn
//
//  Created by Тимофей Шкабров on 17.12.23.
//

import Foundation

func decode<T: Decodable>(_ data: Data) -> T? {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        print(error)
        return nil
    }
}
