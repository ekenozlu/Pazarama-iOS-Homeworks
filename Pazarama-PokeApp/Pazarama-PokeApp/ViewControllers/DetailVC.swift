//
//  PokeDetailsViewController.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit

class DetailVC: UIViewController {
    
    var primaryColor = UIColor()
    var secondaryColor = UIColor()
    
    private let aboutText: UILabel = {
        let label = UILabel()
        label.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
        label.font = UIFont(name: "Poppins-Regular", size: 10)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = UIFont(name: "Poppins-Bold", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 46, height: 20)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 120, bottom: 0, right: 120)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.borderColor = UIColor.black.cgColor
        return cv
    }()
    
    private let pokeballImage: UIImageView = {
        let iv = UIImageView()
        iv.image = .pokeballBig.withRenderingMode(.alwaysTemplate)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "arrow_back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pokemonName: UILabel = {
        let name = UILabel()
        name.text = "This is a test text."
        name.font = .systemFont(ofSize: 24, weight: .bold)
        name.numberOfLines = 0
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let pokemonID: UILabel = {
        let name = UILabel()
        name.text = "#001"
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.numberOfLines = 0
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = .charmander
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron_right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron_left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let aboutStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.backgroundColor = .systemGray3
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let baseStatsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let baseStatsLabel: UILabel = {
        let label = UILabel()
        label.text = "Base Stats"
        label.font = UIFont(name: "Poppins-Bold", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var weightView: AboutView!
    var heightView: AboutView!
    var movesView: AboutView!
    
    var stat1: BaseStatsView!
    var stat2: BaseStatsView!
    var stat3: BaseStatsView!
    var stat4: BaseStatsView!
    var stat5: BaseStatsView!
    var stat6: BaseStatsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        view.backgroundColor = .white
        addViews()
        createConstraints()
    }
    
    private func addViews() {
        view.addSubview(pokeballImage)
        view.addSubview(detailView)
        view.addSubview(pokemonID)
        view.addSubview(imageView)
        view.addSubview(pokemonName)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        view.addSubview(typeCollectionView)
        view.addSubview(aboutLabel)
        view.addSubview(aboutStack)
        view.addSubview(aboutText)
        view.addSubview(baseStatsLabel)
        view.addSubview(baseStatsStack)
        
        primaryColor = (imageView.image?.primaryColor)!
        secondaryColor = (imageView.image?.secondaryColor)!
        
        
        declareViews()
        
        aboutStack.addArrangedSubview(weightView)
        aboutStack.addArrangedSubview(heightView)
        aboutStack.addArrangedSubview(movesView)
        
        baseStatsStack.addArrangedSubview(stat1)
        baseStatsStack.addArrangedSubview(stat2)
        baseStatsStack.addArrangedSubview(stat3)
        baseStatsStack.addArrangedSubview(stat4)
        baseStatsStack.addArrangedSubview(stat5)
        baseStatsStack.addArrangedSubview(stat6)
        
        view.backgroundColor = primaryColor
        pokeballImage.tintColor = secondaryColor
        aboutLabel.textColor = primaryColor
        baseStatsLabel.textColor = primaryColor
        
        stat1.statName.textColor = primaryColor
        stat1.progressBar.progressTintColor = primaryColor
        stat1.progressBar.trackTintColor = secondaryColor
        
        stat2.statName.textColor = primaryColor
        stat2.progressBar.progressTintColor = primaryColor
        stat2.progressBar.trackTintColor = secondaryColor
        
        stat3.statName.textColor = primaryColor
        stat3.progressBar.progressTintColor = primaryColor
        stat3.progressBar.trackTintColor = secondaryColor
        
        stat4.statName.textColor = primaryColor
        stat4.progressBar.progressTintColor = primaryColor
        stat4.progressBar.trackTintColor = secondaryColor
        
        stat5.statName.textColor = primaryColor
        stat5.progressBar.progressTintColor = primaryColor
        stat5.progressBar.trackTintColor = secondaryColor
        
        stat6.statName.textColor = primaryColor
        stat6.progressBar.progressTintColor = primaryColor
        stat6.progressBar.trackTintColor = secondaryColor
    }
    
    private func declareViews() {
        typeCollectionView.delegate = self
        typeCollectionView.dataSource = self
        typeCollectionView.register(TypeCell.self, forCellWithReuseIdentifier: TypeCell.identifier)
        
        weightView = AboutView(image: UIImage(named: "weight"), info1: "6.5 kg", info2: nil, info3: "weight")
        heightView = AboutView(image: UIImage(named: "straighten"), info1: "0.7 m", info2: nil, info3: "Height")
        movesView = AboutView(image: nil, info1: "Move1", info2: "Move2", info3: "Moves")
        
        
        stat1 = BaseStatsView(label1Text: "HP", label2Text: "45", progress: 45 / 100)
        stat2 = BaseStatsView(label1Text: "ATK", label2Text: "49", progress: 49 / 100)
        stat3 = BaseStatsView(label1Text: "DEF", label2Text: "49", progress: 49 / 100)
        stat4 = BaseStatsView(label1Text: "SATK", label2Text: "65", progress: 65 / 100)
        stat5 = BaseStatsView(label1Text: "SDEF", label2Text: "65", progress: 65 / 100)
        stat6 = BaseStatsView(label1Text: "SPD", label2Text: "45", progress: 45 / 100)
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            
            pokeballImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            pokeballImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            pokeballImage.widthAnchor.constraint(equalToConstant: view.frame.size.width - 150),
            pokeballImage.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.3),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            pokemonName.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
            pokemonName.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            pokemonName.widthAnchor.constraint(equalToConstant: 232),
            
            pokemonID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pokemonID.centerYAnchor.constraint(equalTo: pokemonName.centerYAnchor),
            
            imageView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 76),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -76),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            previousButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            previousButton.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -32),
            
            nextButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 32),
            
            
            detailView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 180),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            typeCollectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            typeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            typeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            typeCollectionView.heightAnchor.constraint(equalToConstant: 30),
            
            aboutLabel.topAnchor.constraint(equalTo: typeCollectionView.bottomAnchor, constant: 10),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            aboutStack.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 16),
            aboutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            aboutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
            aboutText.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 16),
            aboutText.leadingAnchor.constraint(equalTo: aboutStack.leadingAnchor, constant: 2),
            aboutText.trailingAnchor.constraint(equalTo: aboutStack.trailingAnchor, constant:  -2),
            
            baseStatsLabel.topAnchor.constraint(equalTo: aboutText.bottomAnchor, constant: 12),
            baseStatsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            baseStatsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            baseStatsStack.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor, constant: 12),
            baseStatsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            baseStatsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            baseStatsStack.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant:  -4),
        ])
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true)
    }
}
