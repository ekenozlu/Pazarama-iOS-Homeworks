//
//  KitchensCell.swift
//  Homework1
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class KitchensCVCell: UICollectionViewCell {
    
    let kitchenImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = UIColor(named: "PlaceholderFont")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let kitchenNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PrimaryFont")
        label.textAlignment = .center
        label.font = .init(name: "Metropolis-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        backgroundColor = .clear
        
        addSubview(kitchenImageView)
        kitchenImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        kitchenImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        kitchenImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        kitchenImageView.heightAnchor.constraint(equalTo: kitchenImageView.widthAnchor, multiplier: 1).isActive = true
        
        addSubview(kitchenNameLabel)
        kitchenNameLabel.topAnchor.constraint(equalTo: kitchenImageView.bottomAnchor,constant: 4).isActive = true
        kitchenNameLabel.leftAnchor.constraint(equalTo: kitchenImageView.leftAnchor).isActive = true
        kitchenNameLabel.rightAnchor.constraint(equalTo: kitchenImageView.rightAnchor).isActive = true
        kitchenNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
