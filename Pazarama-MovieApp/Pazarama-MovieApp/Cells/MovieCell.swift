//
//  TableViewCell.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 5.11.2023.
//

import UIKit
import Hero

class MovieCell: UITableViewCell {
    
    let posterImage = UIImageView()
    let titleLabel = UILabel()
    let yearLabel = UILabel()
    let typeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    func createCell() {
        backgroundColor = .clear
        
        let backView = GradientView()
        backView.heroID = "backView"
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.heroID = "posterImage"
        posterImage.backgroundColor = .clear
        posterImage.layer.cornerRadius = 4
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        backView.addSubview(posterImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20, weight: .black)
        titleLabel.numberOfLines = 3
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        backView.addSubview(titleLabel)
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = .systemFont(ofSize: 14, weight: .thin)
        yearLabel.numberOfLines = 1
        yearLabel.textColor = .white
        yearLabel.textAlignment = .left
        backView.addSubview(yearLabel)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .systemFont(ofSize: 16, weight: .regular)
        typeLabel.numberOfLines = 1
        typeLabel.textColor = .white
        typeLabel.textAlignment = .left
        backView.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            posterImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            posterImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8),
            posterImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8),
            posterImage.widthAnchor.constraint(equalTo: posterImage.heightAnchor, multiplier: 2/3),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            
            typeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            typeLabel.bottomAnchor.constraint(equalTo: posterImage.bottomAnchor),
            
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            yearLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            yearLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -4)
        ])
        
    }
    
}
