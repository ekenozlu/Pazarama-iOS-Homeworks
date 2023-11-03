//
//  TypeCell.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit

class TypeCell: UICollectionViewCell {
    
     static let identifier = "TypeCell"
    
     let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type1"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 10)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .systemGreen
        label.layer.cornerRadius = 50
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    private func setup() {
        contentView.addSubview(typeLabel)
        contentView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
