//
//  PopularRestaurantsCell.swift
//  Homework1
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class PopularRestaurantsTVCell: UITableViewCell {
    
    let restaurantImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let restaurantNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restaurantTypeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .systemOrange
        return imageView
    }()
    
    let ratingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        backgroundColor = .white
        
        addSubview(restaurantImageView)
        restaurantImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        restaurantImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        restaurantImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65).isActive = true
        
        addSubview(restaurantNameLabel)
        restaurantNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        restaurantNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 4).isActive = true
        restaurantNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(restaurantTypeLabel)
        restaurantTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        restaurantTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        restaurantTypeLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        restaurantTypeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(starImage)
        starImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        starImage.topAnchor.constraint(equalTo: restaurantTypeLabel.bottomAnchor, constant: 4).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(ratingLabel)
        ratingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: starImage.topAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: starImage.heightAnchor, multiplier: 1).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
        addSubview(ratingCountLabel)
        ratingCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor,constant: 4).isActive = true
        ratingCountLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor).isActive = true
        ratingCountLabel.heightAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
