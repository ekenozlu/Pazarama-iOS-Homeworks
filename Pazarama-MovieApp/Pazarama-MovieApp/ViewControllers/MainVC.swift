//
//  ViewController.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 5.11.2023.
//

import UIKit
import SDWebImage

class MainVC: UIViewController, MainViewModelProtocol, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel : MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    let centerLabel = UILabel()
    let movieTV = UITableView()
    
    var shownArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .black
        
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = "Movie App"
        
        
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        centerLabel.textColor = .white
        centerLabel.textAlignment = .center
        centerLabel.font = .systemFont(ofSize: 18, weight: .regular)
        centerLabel.numberOfLines = 0
        view.addSubview(centerLabel)
        
        movieTV.translatesAutoresizingMaskIntoConstraints = false
        movieTV.dataSource = self
        movieTV.delegate = self
        movieTV.rowHeight = 180
        movieTV.separatorColor = .clear
        movieTV.backgroundColor = .black
        movieTV.register(MovieCell.self, forCellReuseIdentifier: "movieCell")
        view.addSubview(movieTV)
        updateTV()
        
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            centerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
        
            movieTV.topAnchor.constraint(equalTo: view.topAnchor),
            movieTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieTV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieTV.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchMoviesByQuery(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        shownArray.removeAll()
        updateTV()
    }
    
    func updateMovieTV(with array: [Movie]) {
        DispatchQueue.main.async {
            self.shownArray = array
            self.updateTV()
        }
    }
    
    func updateTV() {
        if shownArray.isEmpty {
            movieTV.isHidden = true
            if let text = searchController.searchBar.text, !text.isEmpty, text.count > 2 {
                centerLabel.text = "Sorry :(\nWe couldn't find a movie called \(text) in our database"
            } else {
                centerLabel.text = "Make a new search to see movies"
            }
        } else {
            movieTV.isHidden = false
        }
        movieTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = shownArray[indexPath.row]
        cell.posterImage.sd_setImage(with: URL(string: movie.poster))
        cell.titleLabel.text = movie.title
        cell.typeLabel.text = movie.type
        cell.yearLabel.text = movie.year
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieService = APIManager()
        let detailVM = DetailViewModel(movieService: movieService)
        let detailVC = DetailVC(viewModel: detailVM)
        detailVC.selectedMovieID = shownArray[indexPath.row].imdbID
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


