//
//  asdf.swift
//  Homework1
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import Hero

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(CustomTabbar(frame: tabBar.frame), forKey: "tabBar")
        self.delegate = self
        setupMiddleButton()
        
        
        let vc1 = LeftVC()
        let vc2 = LeftVC()
        let vc3 = HomeVC()
        let vc4 = RightVC()
        let vc5 = RightVC()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        nav1.isHeroEnabled = true
        nav2.isHeroEnabled = true
        nav3.isHeroEnabled = true
        nav4.isHeroEnabled = true
        nav5.isHeroEnabled = true
        
        configureNavController(nav1)
        configureNavController(nav2)
        configureNavController(nav3)
        configureNavController(nav4)
        configureNavController(nav5)
        
        nav1.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName:"square.grid.2x2.fill"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Offers", image: UIImage(systemName:"bag.fill"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName:""), tag: 2)
        nav4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName:"person.fill"), tag: 3)
        nav5.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName:"list.bullet.indent"), tag: 4)
        
        setViewControllers([nav1,nav2,nav3,nav4,nav5], animated: true)
        
        self.selectedIndex = 2
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton()
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.setImage(UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        middleButton.imageView?.tintColor = .white
        middleButton.backgroundColor = UIColor(named:"AppOrange")
        middleButton.layer.cornerRadius = 30
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        self.tabBar.addSubview(middleButton)
        middleButton.leadingAnchor.constraint(equalTo: self.tabBar.centerXAnchor, constant: -30).isActive = true
        middleButton.trailingAnchor.constraint(equalTo: self.tabBar.centerXAnchor, constant: 30).isActive = true
        middleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        middleButton.centerYAnchor.constraint(equalTo: self.tabBar.topAnchor,constant: 10).isActive = true
        
        self.view.layoutIfNeeded()
    }
    
    func configureNavController (_ controller: UINavigationController) {
        controller.navigationBar.prefersLargeTitles = false
        controller.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "PrimaryFont")!]
        controller.navigationBar.tintColor = UIColor(named: "PrimaryFont")
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = UIColor.white
            controller.navigationBar.standardAppearance = navBarAppearance
            controller.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            controller.edgesForExtendedLayout = []
        }
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
    
}
