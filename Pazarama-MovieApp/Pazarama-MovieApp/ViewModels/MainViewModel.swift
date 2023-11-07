//
//  MainViewModel.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import Foundation

class MainViewModel {
    
    private let movieService : MovieAPIService
    weak var delegate : MainViewModelProtocol?
    
    init(movieService: MovieAPIService) {
        self.movieService = movieService
    }
    
    func fetchMoviesByQuery(with title : String){
        movieService.searchMovie(byTitle: title) { result in
            switch result {
            case .success(let model):
                self.delegate?.updateMovieTV(with: model)
            case .failure:
                self.delegate?.updateMovieTV(with: [Movie]())
            }
        }
    }
    
}
