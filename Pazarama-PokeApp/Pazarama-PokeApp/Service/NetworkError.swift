//
//  NetworkError.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 4.11.2023.
//

import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidData
    case decodeError
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidData:
            return "Invalid Data"
        case .decodeError:
            return "Decoding Error"
        }
    }
}
