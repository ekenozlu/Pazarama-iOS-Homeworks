//
//  Extension-CollectionView.swift
//  Homework1
//
//  Created by Eken Özlü on 16.10.2023.
//

import UIKit
import Hero

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case kitchensCV :
            return kitchenArray.count
        case popularCV :
            return restaurantArrayForCV.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case kitchensCV :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kitchenCell", for: indexPath) as! KitchensCVCell
            let kitchen = kitchenArray[indexPath.row]
            cell.kitchenImageView.image = UIImage(named: kitchen.kitchenImageName)
            cell.kitchenNameLabel.text = kitchen.kitchenName
            return cell
        case popularCV :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! MostPopularCVCell
            cell.isHeroEnabled = true
            let restaurant = restaurantArrayForCV[indexPath.row]
            cell.restaurantNameLabel.text = restaurant.restaurantName
            cell.restaurantImageView.image = UIImage(named: restaurant.restaurantImageName)
            cell.restaurantTypeLabel.text = restaurant.restaurantType
            cell.ratingLabel.text = "\(restaurant.restaurantRating)"
            return cell
        default :
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case kitchensCV :
            break
        case popularCV :
            let detailVC = DetailVC()
            detailVC.selectedRestaurant = restaurantArrayForCV[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        default :
            break
        }
    }
}
