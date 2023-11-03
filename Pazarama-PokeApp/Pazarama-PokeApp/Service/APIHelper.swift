//
//  APIHelper.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidUrl = "InvalidUrl"
    case noData = "No data"
    case invalidRequest = "Invalid request"
    case generalError = "General Error"
    case parsingError = "Parsing Error"
    case responseError = "Response Error"
}

protocol EndPointProtocol {
    var baseURL: String { get }
    var path: String { get }
    func request() -> URLRequest
}

enum EndPoint {
    case pokemon
    case pokemonDetail(name: String)
}
