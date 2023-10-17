//
//  MostPopularCell.swift
//  Homework1
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class MostPopularCVCell: UICollectionViewCell {
    
    let restaurantImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = UIColor(named: "PlaceholderFont")
        return imageView
    }()
    
    let restaurantNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryFont")
        label.textAlignment = .left
        label.font = .init(name: "Metropolis-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restaurantTypeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "SecondaryFont")
        label.textAlignment = .left
        label.font = .init(name: "Metropolis-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(named:"AppOrange")
        return imageView
    }()
    
    let ratingLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named:"AppOrange")
        label.textAlignment = .left
        label.font = .init(name: "Metropolis-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        backgroundColor = .white
        
        addSubview(restaurantImageView)
        restaurantImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        restaurantImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        restaurantImageView.heightAnchor.constraint(equalTo: restaurantImageView.widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(restaurantNameLabel)
        restaurantNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 4).isActive = true
        restaurantNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(restaurantTypeLabel)
        restaurantTypeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantTypeLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        restaurantTypeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        restaurantTypeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        addSubview(starImage)
        starImage.leftAnchor.constraint(equalTo: restaurantTypeLabel.rightAnchor, constant: 10).isActive = true
        starImage.centerYAnchor.constraint(equalTo: restaurantTypeLabel.centerYAnchor).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(ratingLabel)
        ratingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: starImage.topAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: starImage.heightAnchor, multiplier: 1).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
