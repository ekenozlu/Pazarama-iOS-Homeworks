//
//  APIProtocol.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 7.11.2023.
//

import Foundation

protocol MovieAPIService {
    func searchMovie(byTitle title : String, completion: @escaping (Result<[Movie],Error>) -> ())
    func getMovieDetail(byID id : String, completion: @escaping (Result<MovieDetail,Error>) -> ())
}

