//
//  DetailViewModel.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import Foundation

class DetailViewModel {
    
    private let movieService : MovieAPIService
    weak var delegate : DetailViewModelProtocol?
    
    init(movieService: MovieAPIService) {
        self.movieService = movieService
    }
    
    func fetchMovieDetail(with id : String){
        movieService.getMovieDetail(byID: id) { result in
            switch result {
            case .success(let model):
                self.delegate?.updateMovieDetail(with: model)
            case .failure:
                self.delegate?.updateMovieDetail(with: MovieDetail(title: "No Detail", year: "", runtime: "", genre: "", director: "", writer: "", actors: "", plot: "", poster: "", imdbRating: "", imdbID: ""))
            }
        }
    }
    
}
