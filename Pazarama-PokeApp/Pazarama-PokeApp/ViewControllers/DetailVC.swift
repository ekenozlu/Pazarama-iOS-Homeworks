//
//  PokeDetailsViewController.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit
import SDWebImage

class DetailVC: UIViewController, PokemonDetailViewModelOutPut {
    
    var selectedIndex : Int
    var selectedPokemonName : String = ""
    var primaryColor = UIColor.black
    var secondaryColor = UIColor.white
    var detailViewModel : PokemonDetailViewModel
    
    init(detailViewModel: PokemonDetailViewModel, index: Int) {
        self.detailViewModel = detailViewModel
        self.selectedIndex = index
        super.init(nibName: nil, bundle: nil)
        detailViewModel.output = self
        selectedPokemonName = shownArray[self.selectedIndex].name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow_back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pokemonName: UILabel = {
        let name = UILabel()
        name.text = "Pokemon Name"
        name.font = UIFont(name: "Poppins-Bold", size: 24)
        name.numberOfLines = 1
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let pokemonID: UILabel = {
        let name = UILabel()
        name.text = "#001"
        name.font = UIFont(name: "Poppins-Regular", size: 18)
        name.numberOfLines = 1
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let pokeballImage: UIImageView = {
        let iv = UIImageView()
        iv.image = .pokeballBig.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let pokemonImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(.chevronRight, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(.chevronLeft, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let typeStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .center
        sv.backgroundColor = .clear
        sv.spacing = 8
        return sv
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = UIFont(name: "Poppins-Black", size: 18)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let aboutText: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let baseStatsLabel: UILabel = {
        let label = UILabel()
        label.text = "Base Stats"
        label.font = UIFont(name: "Poppins-Black", size: 18)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let baseStatsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var weightView : AboutView!
    var heightView : AboutView!
    var movesView : AboutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.fetchPokemonDetail(selectedPokemonName)
    }
    
    private func createUI() {
        view.backgroundColor = primaryColor
        
        view.addSubview(detailView)
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
        view.addSubview(pokemonName)
        view.addSubview(pokemonID)
        view.addSubview(pokeballImage)
        view.addSubview(pokemonImage)
        
        if selectedIndex == 0 {
            previousButton.isHidden = true
            nextButton.isHidden = false
        } else if selectedIndex == shownArray.count - 1 {
            previousButton.isHidden = false
            nextButton.isHidden = true
        } else {
            previousButton.isHidden = false
            nextButton.isHidden = false
        }
        previousButton.addTarget(self, action: #selector(arrowTapped(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(arrowTapped(_:)), for: .touchUpInside)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        
        detailView.addSubview(typeStackView)
        
        aboutLabel.textColor = primaryColor
        detailView.addSubview(aboutLabel)
        detailView.addSubview(aboutStack)
        aboutStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        detailView.addSubview(aboutText)
        
        baseStatsLabel.textColor = primaryColor
        detailView.addSubview(baseStatsLabel)
        
        detailView.addSubview(baseStatsStack)
        baseStatsStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        view.backgroundColor = primaryColor
        createConstraints()
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            pokeballImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            pokeballImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pokeballImage.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.55),
            pokeballImage.heightAnchor.constraint(equalToConstant: view.frame.size.width * 0.55),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            pokemonName.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
            pokemonName.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            pokemonName.widthAnchor.constraint(equalToConstant: 232),
            
            pokemonID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pokemonID.centerYAnchor.constraint(equalTo: pokemonName.centerYAnchor),
            
            pokemonImage.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 30),
            pokemonImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 76),
            pokemonImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -76),
            pokemonImage.heightAnchor.constraint(equalToConstant: 200),
            
            previousButton.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            previousButton.heightAnchor.constraint(equalToConstant: 40),
            previousButton.widthAnchor.constraint(equalToConstant: 40),
            
            nextButton.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 40),
            
            detailView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 180),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            
            typeStackView.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 10),
            typeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typeStackView.heightAnchor.constraint(equalToConstant: 30),
            
            aboutLabel.topAnchor.constraint(equalTo: typeStackView.bottomAnchor, constant: 16),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            aboutLabel.heightAnchor.constraint(equalToConstant: 18),
            
            aboutStack.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 10),
            aboutStack.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            aboutStack.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            aboutStack.heightAnchor.constraint(equalToConstant: 70),
            
            aboutText.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 16),
            aboutText.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 4),
            aboutText.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant:  -4),
            aboutText.heightAnchor.constraint(equalToConstant: 120),
            
            baseStatsStack.heightAnchor.constraint(equalToConstant: 120),
            baseStatsStack.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            baseStatsStack.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
            baseStatsStack.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant:  -10),
            
            baseStatsLabel.bottomAnchor.constraint(equalTo: baseStatsStack.topAnchor, constant: -10),
            baseStatsLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            baseStatsLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func addTypes(typeArray : [PokemonTypes]) {
        typeStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        for type in typeArray {
            primaryColor = UIColor(named: typeArray.first?.type.name.capitalized ?? "") ?? .black
            secondaryColor = primaryColor.withAlphaComponent(0.2)
            
            let typeView = UIView()
            typeView.translatesAutoresizingMaskIntoConstraints = false
            typeView.backgroundColor = UIColor(named: type.type.name.capitalized) ?? .black
            typeView.layer.cornerRadius = 10
            typeStackView.addArrangedSubview(typeView)
            typeView.widthAnchor.constraint(equalToConstant: 70).isActive = true
            typeView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = type.type.name.capitalized
            label.textColor = .white
            label.font = UIFont(name: "Poppins-Bold", size: 15)
            label.textAlignment = .center
            label.numberOfLines = 1
            typeView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: typeView.leadingAnchor, constant: 2).isActive = true
            label.trailingAnchor.constraint(equalTo: typeView.trailingAnchor, constant: -2).isActive = true
            label.topAnchor.constraint(equalTo: typeView.topAnchor, constant: 2).isActive = true
            label.bottomAnchor.constraint(equalTo: typeView.bottomAnchor, constant: -2).isActive = true
        }
        
        createUI()
    }
    
    func getPokemonDetail(_ pokemon: PokemonDetails) {
        detailViewModel.fetchPokemonSpecies(url: pokemon.species.url)
        
        DispatchQueue.main.async {
            
            self.pokemonName.text = pokemon.name.capitalized
            self.pokemonID.text = "#\(String(format: "%03d", pokemon.id))"
            self.pokemonImage.sd_setImage(with: URL(string: pokemon.sprites.other.officialArtwork.frontDefault))
            self.addTypes(typeArray: pokemon.types)
            
            let weightView = AboutView(isWithImage: true, image: UIImage(named: "weight"),
                                       info1: "\(Float(pokemon.weight) / 10) kg", info2: nil, info3: "Weight")
            let heightView = AboutView(isWithImage: true, image: UIImage(named: "straighten"),
                                       info1: "\(Float(pokemon.height) / 10) m", info2: nil, info3: "Height")
            let movesView = AboutView(isWithImage: false, image: nil,
                                      info1: pokemon.abilities.first?.ability.name.capitalized ?? "" , info2: pokemon.abilities.last?.ability.name.capitalized ?? "", info3: "Moves")
            self.aboutStack.addArrangedSubview(weightView)
            self.aboutStack.addArrangedSubview(heightView)
            self.aboutStack.addArrangedSubview(movesView)
            
            let stat1 = BaseStatsView(frame: .zero, label1Text: "HP", label2Text: "\(pokemon.stats[0].baseStat)", progress: Float(pokemon.stats[0].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            let stat2 = BaseStatsView(frame: .zero, label1Text: "ATK", label2Text: "\(pokemon.stats[1].baseStat)", progress: Float(pokemon.stats[1].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            let stat3 = BaseStatsView(frame: .zero, label1Text: "DEF", label2Text: "\(pokemon.stats[2].baseStat)", progress: Float(pokemon.stats[2].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            let stat4 = BaseStatsView(frame: .zero, label1Text: "SATK", label2Text: "\(pokemon.stats[3].baseStat)", progress: Float(pokemon.stats[3].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            let stat5 = BaseStatsView(frame: .zero, label1Text: "SDEF", label2Text: "\(pokemon.stats[4].baseStat)", progress: Float(pokemon.stats[4].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            let stat6 = BaseStatsView(frame: .zero, label1Text: "SPD", label2Text: "\(pokemon.stats[5].baseStat)", progress: Float(pokemon.stats[5].baseStat) / 225,
                                      primColor: self.primaryColor, secColor: self.secondaryColor)
            self.baseStatsStack.addArrangedSubview(stat1)
            self.baseStatsStack.addArrangedSubview(stat2)
            self.baseStatsStack.addArrangedSubview(stat3)
            self.baseStatsStack.addArrangedSubview(stat4)
            self.baseStatsStack.addArrangedSubview(stat5)
            self.baseStatsStack.addArrangedSubview(stat6)
        }
    }
    
    func getPokemonSpecies(_ flavorTextEntries: Species) {
        DispatchQueue.main.async {
            self.aboutText.text = flavorTextEntries.flavorTextEntries[9].flavorText?.capitalized
        }
    }
    
    @objc func arrowTapped(_ sender : UIButton) {
        if sender == previousButton {
            selectedIndex -= 1
        } else if sender == nextButton {
            selectedIndex += 1
        }
        selectedPokemonName = shownArray[selectedIndex].name
        detailViewModel.fetchPokemonDetail(selectedPokemonName)
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true)
    }
}
