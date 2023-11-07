//
//  ViewModelProtocols.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 7.11.2023.
//

import Foundation

protocol MainViewModelProtocol : AnyObject {
    func updateMovieTV(with array : [Movie])
}

protocol DetailViewModelProtocol : AnyObject {
    func updateMovieDetail(with movie : MovieDetail)
}
