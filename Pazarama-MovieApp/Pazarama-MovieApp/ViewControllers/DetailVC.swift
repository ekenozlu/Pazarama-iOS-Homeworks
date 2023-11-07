//
//  DetailVC.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 5.11.2023.
//

import UIKit
import Hero

class DetailVC: UIViewController, DetailViewModelProtocol {
    
    private let viewModel : DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let posterImage = UIImageView()
    let titleLabel = UILabel()
    let genreLabel = UILabel()
    let yearView = InfoView(frame: .zero, image: UIImage(systemName: "calendar")!, title: "YYYY")
    let runtimeView = InfoView(frame: .zero, image: UIImage(systemName: "clock.arrow.circlepath")!, title: "90 min")
    let ratingView = InfoView(frame: .zero, image: UIImage(systemName: "star.fill")!, title: "9.4")
    let directorView = LabelWithTitleView(title: "Directed by:", text: "")
    let plotView = LabelWithTitleView(title: "Plot:", text: "")
    let castView = LabelWithTitleView(title: "Cast:", text: "")
    let writerView = LabelWithTitleView(title: "Written by:", text: "")
    
    var selectedMovieID = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        viewModel.fetchMovieDetail(with: selectedMovieID)
    }
    
    func createUI() {
        view.backgroundColor = .black
        
        let backView = GradientView()
        backView.heroID = "backView"
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.heroID = "posterImage"
        posterImage.backgroundColor = .clear
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 8
        posterImage.layer.borderWidth = 2
        posterImage.layer.borderColor = UIColor.white.cgColor
        posterImage.clipsToBounds = true
        view.addSubview(posterImage)
        
        titleLabel.text = "The Movie Title goes here and also here for second row and up to three rows"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        backView.addSubview(titleLabel)
        
        genreLabel.text = "Genre1, Genre2"
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.font = .systemFont(ofSize: 16, weight: .regular)
        genreLabel.numberOfLines = 1
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
        backView.addSubview(genreLabel)
        
        let infoStackView = UIStackView()
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.axis = .horizontal
        infoStackView.distribution = .equalSpacing
        infoStackView.spacing = 2
        infoStackView.backgroundColor = .clear
        infoStackView.addArrangedSubview(yearView)
        infoStackView.addArrangedSubview(runtimeView)
        infoStackView.addArrangedSubview(ratingView)
        backView.addSubview(infoStackView)
        
        let textScrollView = UIScrollView()
        textScrollView.translatesAutoresizingMaskIntoConstraints = false
        textScrollView.backgroundColor = .clear
        backView.addSubview(textScrollView)
        
        let textStackView = UIStackView()
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.axis = .vertical
        textStackView.distribution = .equalSpacing
        textStackView.spacing = 4
        textStackView.backgroundColor = .clear
        textStackView.addArrangedSubview(directorView)
        textStackView.addArrangedSubview(plotView)
        textStackView.addArrangedSubview(castView)
        textStackView.addArrangedSubview(writerView)
        textScrollView.addSubview(textStackView)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            backView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            posterImage.centerYAnchor.constraint(equalTo: backView.topAnchor,constant: -30),
            posterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImage.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 2/5),
            posterImage.heightAnchor.constraint(equalTo: posterImage.widthAnchor, multiplier: 3/2),
            
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            
            genreLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 4),
            genreLabel.heightAnchor.constraint(equalToConstant: 16),
            
            infoStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 40),
            infoStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -40),
            infoStackView.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 8),
            infoStackView.heightAnchor.constraint(equalToConstant: 50),
            
            textScrollView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 4),
            textScrollView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -4),
            textScrollView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 4),
            textScrollView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -4),
            
            textStackView.leadingAnchor.constraint(equalTo: textScrollView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: textScrollView.trailingAnchor),
            textStackView.topAnchor.constraint(equalTo: textScrollView.topAnchor),
            textStackView.bottomAnchor.constraint(equalTo: textScrollView.bottomAnchor),
            textStackView.widthAnchor.constraint(equalTo: textScrollView.widthAnchor),
            
            directorView.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor),
            directorView.widthAnchor.constraint(equalTo: textStackView.widthAnchor),
        ])
    }
    
    func updateMovieDetail(with movie: MovieDetail) {
        DispatchQueue.main.async {
            self.posterImage.sd_setImage(with: URL(string:movie.poster))
            self.titleLabel.text = movie.title
            self.genreLabel.text = movie.genre
            self.yearView.infoLabel.text = movie.year
            self.runtimeView.infoLabel.text = movie.runtime
            self.ratingView.infoLabel.text = movie.imdbRating
            self.directorView.textLabel.text = movie.director
            self.plotView.textLabel.text = movie.plot
            self.castView.textLabel.text = movie.actors
            self.writerView.textLabel.text = movie.writer
        }
    }
    
}
