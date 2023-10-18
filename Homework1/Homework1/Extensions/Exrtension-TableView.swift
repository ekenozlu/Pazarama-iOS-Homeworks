//
//  Exrtension-TableView.swift
//  Homework1
//
//  Created by Eken Özlü on 16.10.2023.
//

import UIKit
import Hero

extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case popularTV:
            return restaurantArrayForTV.count
        case recentTV:
            return recentItemsArray.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case popularTV:
            let cell = tableView.dequeueReusableCell(withIdentifier: "popularTVCell", for: indexPath) as! PopularRestaurantsTVCell
            let restaurant = restaurantArrayForTV[indexPath.row]
            cell.isHeroEnabled = true
            cell.restaurantNameLabel.text = restaurant.restaurantName
            cell.restaurantImageView.image = UIImage(named: restaurant.restaurantImageName)
            cell.restaurantTypeLabel.text = restaurant.restaurantType
            cell.ratingLabel.text = "\(restaurant.restaurantRating)"
            cell.ratingCountLabel.text = "(\(restaurant.restaurantRatingCount) ratings)"
            return cell
        case recentTV:
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentItemsCell", for: indexPath) as! RecentItemsTVCell
            cell.isHeroEnabled = true
            let item = recentItemsArray[indexPath.row]
            cell.itemNameLabel.text = item.itemName
            cell.itemImageView.image = UIImage(named: item.itemImageName)
            cell.itemRestaurantNameLabel.text = "from \(item.itemRestaurant)"
            cell.itemRestaurantRatingLabel.text = "\(item.itemRestaurantRating)"
            cell.ratingCountLabel.text = "(\(item.ratingCount) ratings)"
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case popularTV:
            let detailVC = DetailVC()
            detailVC.selectedRestaurant = restaurantArrayForTV[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        case recentTV:
            let detailVC = DetailVC()
            detailVC.selectedItem = recentItemsArray[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
