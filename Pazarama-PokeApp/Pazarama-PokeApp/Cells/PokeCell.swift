//
//  PokeCell.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    let pokeNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let pokeImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let pokeNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private func addViews() {
        backgroundColor = .white
        layer.cornerRadius = 8
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        
        let greyView = UIView()
        greyView.translatesAutoresizingMaskIntoConstraints = false
        greyView.backgroundColor = .veryLightGray
        greyView.layer.cornerRadius = 8
        addSubview(greyView)
        greyView.topAnchor.constraint(equalTo: centerYAnchor,constant: 10).isActive = true
        greyView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        greyView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        greyView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(pokeNumberLabel)
        pokeNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        pokeNumberLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        pokeNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        pokeNumberLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        addSubview(pokeImageView)
        pokeImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16).isActive = true
        pokeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pokeImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        pokeImageView.widthAnchor.constraint(equalToConstant: 68).isActive = true
        
        addSubview(pokeNameLabel)
        pokeNameLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor,constant: 4).isActive = true
        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 8).isActive = true
        pokeNameLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -8).isActive = true
        pokeNameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
