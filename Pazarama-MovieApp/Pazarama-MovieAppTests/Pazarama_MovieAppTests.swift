//
//  Pazarama_MovieAppTests.swift
//  Pazarama-MovieAppTests
//
//  Created by Eken Özlü on 5.11.2023.
//

import XCTest
@testable import Pazarama_MovieApp

final class Pazarama_MovieAppTests: XCTestCase {
    
    private var mockMainViewModel : MainViewModel!
    private var mockDetailViewModel : DetailViewModel!
    private var mockAPIManager: MockAPIManager!
    private var mainDelegate : MockMainViewModelProtocol!
    private var detailDelegate : MockDetailViewModelProtocol!

    override func setUpWithError() throws {
        mockAPIManager = MockAPIManager()
        mockMainViewModel = MainViewModel(movieService: mockAPIManager)
        mockDetailViewModel = DetailViewModel(movieService: mockAPIManager)
        mainDelegate = MockMainViewModelProtocol()
        detailDelegate = MockDetailViewModelProtocol()
        mockMainViewModel?.delegate = mainDelegate
        mockDetailViewModel?.delegate = detailDelegate
    }

    override func tearDownWithError() throws {
        mockAPIManager = nil
        mockMainViewModel = nil
        mockDetailViewModel = nil
        mainDelegate = nil
        detailDelegate = nil
    }

    func testMovieTV_whenAPISuccess_showsMovieArray() throws {
        let mockMovieArray = [Movie(title: "Mock Title", year: "", imdbID: "", type: "", poster: "")]
        mockAPIManager.mockSearchResult = .success(mockMovieArray)
        mockMainViewModel.fetchMoviesByQuery(with: "")
        XCTAssertEqual(mainDelegate.updateMovieTVArray?.first?.title, "Mock Title")
    }
    
    func testMovieTV_whenAPIFailıure_showsEmptyArray() throws {
        mockAPIManager.mockSearchResult = .failure(NSError())
        mockMainViewModel.fetchMoviesByQuery(with: "")
        XCTAssertEqual(mainDelegate.updateMovieTVArray?.isEmpty, true)
    }
    
    func testMovieDetail_whenAPISuccess_showsMovieDetail() throws {
        let mockMovie = MovieDetail(title: "Mock Movie Detail", year: "", runtime: "", genre: "", director: "", writer: "", actors: "", plot: "", poster: "", imdbRating: "", imdbID: "")
        mockAPIManager.mockDetailResult = .success(mockMovie)
        mockDetailViewModel.fetchMovieDetail(with: "")
        XCTAssertEqual(detailDelegate.movieDetail?.title, "Mock Movie Detail")
    }
    
    func testMovieDetail_whenAPIFailure_showsEmptyMovieDetail() throws {
        mockAPIManager.mockDetailResult = .failure(NSError())
        mockDetailViewModel.fetchMovieDetail(with: "")
        XCTAssertEqual(detailDelegate.movieDetail?.title, "No Detail")
    }
}

class MockAPIManager : MovieAPIService {
    var mockSearchResult : Result<[Movie], Error>?
    func searchMovie(byTitle title: String, completion: @escaping (Result<[Movie], Error>) -> ()) {
        if let result = mockSearchResult {
            completion(result)
        }
    }
    
    var mockDetailResult : Result<MovieDetail, Error>?
    func getMovieDetail(byID id: String, completion: @escaping (Result<MovieDetail, Error>) -> ()) {
        if let result = mockDetailResult {
            completion(result)
        }
    }
}

class MockMainViewModelProtocol : MainViewModelProtocol {
    var updateMovieTVArray : [Movie]?
    func updateMovieTV(with array: [Movie]) {
        updateMovieTVArray = array
    }
}

class MockDetailViewModelProtocol : DetailViewModelProtocol {
    var movieDetail : MovieDetail?
    func updateMovieDetail(with movie: MovieDetail) {
        movieDetail = movie
    }
}
