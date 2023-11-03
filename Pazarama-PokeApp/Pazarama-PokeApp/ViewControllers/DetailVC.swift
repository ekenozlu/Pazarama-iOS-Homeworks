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
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "arrow_back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pokemonName: UILabel = {
        let name = UILabel()
        name.text = "Pokemon Name"
        name.font = .systemFont(ofSize: 24, weight: .bold)
        name.numberOfLines = 1
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let pokemonID: UILabel = {
        let name = UILabel()
        name.text = "#001"
        name.font = .systemFont(ofSize: 18, weight: .regular)
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
        iv.contentMode = .scaleAspectFill
        iv.image = .bulbasaur
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
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
        label.font = .systemFont(ofSize: 18, weight: .black)
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
        label.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let baseStatsLabel: UILabel = {
        let label = UILabel()
        label.text = "Base Stats"
        label.font = .systemFont(ofSize: 18, weight: .black)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        view.backgroundColor = .white
        
        view.addSubview(detailView)
        view.addSubview(backButton)
        view.addSubview(pokemonName)
        view.addSubview(pokemonID)
        view.addSubview(pokeballImage)
        view.addSubview(pokemonImage)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        
        
        primaryColor = (pokemonImage.image?.primaryColor)!
        secondaryColor = (pokemonImage.image?.secondaryColor)!
        
        addTypes()
        detailView.addSubview(typeStackView)
        
        aboutLabel.textColor = primaryColor
        detailView.addSubview(aboutLabel)
        let weightView = AboutView(isWithImage: true, image: UIImage(named: "weight"),
                                   info1: "6.5 kg", info2: nil, info3: "weight")
        let heightView = AboutView(isWithImage: true, image: UIImage(named: "straighten"),
                                   info1: "0.7 m", info2: nil, info3: "Height")
        let movesView = AboutView(isWithImage: false, image: nil,
                                  info1: "Move1", info2: "Move2", info3: "Moves")
        aboutStack.addArrangedSubview(weightView)
        aboutStack.addArrangedSubview(heightView)
        aboutStack.addArrangedSubview(movesView)
        detailView.addSubview(aboutStack)
        
        detailView.addSubview(aboutText)
        
        baseStatsLabel.textColor = primaryColor
        detailView.addSubview(baseStatsLabel)
        let stat1 = BaseStatsView(frame: .zero, label1Text: "HP", label2Text: "45", progress: 45 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        let stat2 = BaseStatsView(frame: .zero, label1Text: "ATK", label2Text: "49", progress: 49 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        let stat3 = BaseStatsView(frame: .zero, label1Text: "DEF", label2Text: "49", progress: 49 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        let stat4 = BaseStatsView(frame: .zero, label1Text: "SATK", label2Text: "65", progress: 65 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        let stat5 = BaseStatsView(frame: .zero, label1Text: "SDEF", label2Text: "65", progress: 65 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        let stat6 = BaseStatsView(frame: .zero, label1Text: "SPD", label2Text: "45", progress: 45 / 225,
                                  primColor: primaryColor, secColor: secondaryColor)
        baseStatsStack.addArrangedSubview(stat1)
        baseStatsStack.addArrangedSubview(stat2)
        baseStatsStack.addArrangedSubview(stat3)
        baseStatsStack.addArrangedSubview(stat4)
        baseStatsStack.addArrangedSubview(stat5)
        baseStatsStack.addArrangedSubview(stat6)
        detailView.addSubview(baseStatsStack)
        
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
            previousButton.trailingAnchor.constraint(equalTo: pokemonImage.leadingAnchor, constant: -32),
            
            nextButton.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 32),
            
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
    
    private func addTypes() {
        for _ in 0...1 {
            let typeView = UIView()
            typeView.translatesAutoresizingMaskIntoConstraints = false
            typeView.backgroundColor = secondaryColor
            typeView.layer.cornerRadius = 10
            typeStackView.addArrangedSubview(typeView)
            typeView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            typeView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Type"
            label.textColor = .white
            label.font = .systemFont(ofSize: 15, weight: .bold)
            label.textAlignment = .center
            label.numberOfLines = 1
            typeView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: typeView.leadingAnchor, constant: 2).isActive = true
            label.trailingAnchor.constraint(equalTo: typeView.trailingAnchor, constant: -2).isActive = true
            label.topAnchor.constraint(equalTo: typeView.topAnchor, constant: 2).isActive = true
            label.bottomAnchor.constraint(equalTo: typeView.bottomAnchor, constant: -2).isActive = true
        }
        
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true)
    }
}

#Preview{
    DetailVC()
}
