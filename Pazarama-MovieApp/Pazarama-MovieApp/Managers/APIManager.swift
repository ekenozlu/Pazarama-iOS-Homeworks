//
//  APIManager.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import Foundation

class APIManager : MovieAPIService {
    
    private let baseURL = "http://www.omdbapi.com/?apikey=675d11f2&"
    
    func searchMovie(byTitle title : String, completion: @escaping (Result<[Movie],Error>) -> ()) {
        guard let url = URL(string: baseURL + "s=\(title)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let json = try JSONDecoder().decode(SearchModel.self, from: data)
                    if json.error != nil {
                        completion(.failure(NSError()))
                    }else {
                        completion(.success(json.search ?? [Movie]()))
                    }
                } catch {
                    print("Parsing Error")
                }
            } else {
                print("URLSession Error")
            }
        }.resume()
    }
    
    func getMovieDetail(byID id : String, completion: @escaping (Result<MovieDetail,Error>) -> ()) {
        guard let url = URL(string: baseURL + "i=\(id)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let json = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(.success(json))
                } catch {
                    print("Parsing Error")
                }
            } else {
                print("URLSession Error")
            }
        }.resume()
    }
}
