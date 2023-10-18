//
//  ListDetailVC.swift
//  Homework1
//
//  Created by Eken Özlü on 18.10.2023.
//

import UIKit
import Hero

class ListDetailVC: UIViewController {

    var titleText : String?
    var restaurantArray : [RestaurantModel]?
    var itemArray : [RecentItemModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHeroEnabled = true
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = titleText
        titleLabel.textColor = UIColor(named: "PrimaryFont")
        titleLabel.font = .init(name: "Metropolis-ExtraBold", size: 22)
        titleLabel.textAlignment = .left
        titleLabel.hero.id = "titleLabel"
        view.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
    }
}
