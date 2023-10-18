//
//  RestaurantDetailVC.swift
//  Homework1
//
//  Created by Eken Özlü on 18.10.2023.
//

import UIKit
import Hero

class DetailVC: UIViewController {
    
    var selectedRestaurant : RestaurantModel?
    var selectedItem : RecentItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: selectedRestaurant?.restaurantImageName ?? selectedItem?.itemImageName ?? "")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(named: "PlaceholderFont")
        imageView.hero.id = "heroImageView"
        view.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        let restaurantNameLabel = UILabel()
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.text = selectedRestaurant?.restaurantName ?? selectedItem?.itemName ?? ""
        restaurantNameLabel.textColor = UIColor(named: "PrimaryFont")
        restaurantNameLabel.textAlignment = .left
        restaurantNameLabel.font = .init(name: "Metropolis-Bold", size: 20)
        restaurantNameLabel.hero.id = "primaryLabel"
        view.addSubview(restaurantNameLabel)
        restaurantNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        restaurantNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        restaurantNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        restaurantNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let restaurantTypeLabel = UILabel()
        restaurantTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantTypeLabel.text = selectedRestaurant?.restaurantType ?? "from \(selectedItem?.itemRestaurant ?? "")"
        restaurantTypeLabel.textColor = UIColor(named: "SecondaryFont")
        restaurantTypeLabel.textAlignment = .left
        restaurantTypeLabel.font = .init(name: "Metropolis-Medium", size: 18)
        restaurantTypeLabel.hero.id = "secondaryLabel"
        view.addSubview(restaurantTypeLabel)
        restaurantTypeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        restaurantTypeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        restaurantTypeLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        restaurantTypeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let starImage = UIImageView()
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.contentMode = .scaleAspectFill
        starImage.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        starImage.tintColor = UIColor(named:"AppOrange")
        starImage.hero.id = "starImage"
        view.addSubview(starImage)
        starImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        starImage.topAnchor.constraint(equalTo: restaurantTypeLabel.bottomAnchor, constant: 4).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "\(selectedRestaurant?.restaurantRating ?? selectedItem?.itemRestaurantRating ?? 0.0)"
        ratingLabel.textColor = UIColor(named:"AppOrange")
        ratingLabel.textAlignment = .left
        ratingLabel.font = .init(name: "Metropolis-Bold", size: 16)
        ratingLabel.hero.id = "ratingLabel"
        view.addSubview(ratingLabel)
        ratingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: starImage.topAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: starImage.heightAnchor, multiplier: 1).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
        let ratingCountLabel = UILabel()
        ratingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingCountLabel.text = "(\(selectedRestaurant?.restaurantRatingCount ?? selectedItem?.ratingCount ?? 0) ratings)"
        ratingCountLabel.textColor = UIColor(named: "SecondaryFont")
        ratingCountLabel.textAlignment = .left
        ratingCountLabel.font = .init(name: "Metropolis-Regular", size: 16)
        ratingCountLabel.hero.id = "ratingCountLabel"
        view.addSubview(ratingCountLabel)
        ratingCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor,constant: 4).isActive = true
        ratingCountLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor).isActive = true
        ratingCountLabel.heightAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1).isActive = true
        
    }

}
