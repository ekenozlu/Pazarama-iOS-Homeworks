//
//  AboutView.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit

class AboutView: UIView {
    
    private let isWithImage : Bool
    private let imageView = UIImageView()
    private let infoLabel = UILabel()
    private let infoLabel2 = UILabel()
    private let infoLabel3 = UILabel()
    
    init(isWithImage: Bool, image: UIImage? = nil, info1: String, info2: String? = nil, info3: String) {
        self.isWithImage = isWithImage
        super.init(frame: .zero)
        imageView.image = image
        infoLabel.text = info1
        infoLabel2.text = info2
        infoLabel3.text = info3
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        infoLabel.textColor = .black
        
        
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        infoLabel2.font = UIFont(name: "Poppins-Regular", size: 16)
        infoLabel2.textColor = .black
        infoLabel2.textAlignment = .center
        
        infoLabel3.translatesAutoresizingMaskIntoConstraints = false
        infoLabel3.font = UIFont(name: "Poppins-Regular", size: 16)
        infoLabel3.textColor = .gray
        infoLabel3.textAlignment = .center
        addSubview(infoLabel3)
        
        if isWithImage {
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            stackView.addArrangedSubview(imageView)
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            stackView.addArrangedSubview(infoLabel)
            infoLabel.textAlignment = .right
            
            infoLabel3.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            infoLabel3.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
            infoLabel3.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        } else {
            stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
            
            stackView.addArrangedSubview(infoLabel)
            infoLabel.textAlignment = .center
            
            addSubview(infoLabel2)
            infoLabel2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            infoLabel2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
            infoLabel2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
            
            infoLabel3.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
            infoLabel3.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
            infoLabel3.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        heightAnchor.constraint(equalToConstant: 85).isActive = true
    }
}
