//
//  ViewController.swift
//  Homework1
//
//  Created by Eken Özlü on 15.10.2023.
//

//TODO: 1-ADJUST COLORS (imageview backs vs)
//TODO: 2-CLEAR CODE AND NAMES
//TODO: 3-TABBAR
//TODO: 4-SEMI FUNCTIONALITY

import UIKit

class HomeVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let deliveryOptionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return view
    }()
    var deliveryButton = UIButton()
    
    private let searchView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "SearchBar")
        view.layer.cornerRadius = 25
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let popularTVView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 1400).isActive = true
        return view
    }()
    
    private let popularCVView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 270).isActive = true
        return view
    }()
    
    private let recentItemsView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        return view
    }()
    
    var kitchensCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var popularTV = UITableView()
    var popularCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var recentTV = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        createCustomNavigationView()
        
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -8).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(deliveryOptionView)
        let deliveryLabel = UILabel()
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.text = "Delivering to"
        deliveryLabel.textAlignment = .left
        deliveryLabel.font = .init(name: "Metropolis-Regular", size: 16)
        deliveryLabel.textColor = UIColor(named: "SecondaryFont")
        deliveryLabel.numberOfLines = 1
        deliveryOptionView.addSubview(deliveryLabel)
        deliveryLabel.leadingAnchor.constraint(equalTo: deliveryOptionView.leadingAnchor, constant: 10).isActive = true
        deliveryLabel.topAnchor.constraint(equalTo: deliveryOptionView.topAnchor, constant: 4).isActive = true
        deliveryLabel.widthAnchor.constraint(equalTo: deliveryOptionView.widthAnchor, multiplier: 0.4).isActive = true
        
        deliveryButton = UIButton(type: .system)
        deliveryButton.translatesAutoresizingMaskIntoConstraints = false
        deliveryButton.showsMenuAsPrimaryAction = true
        deliveryButton.changesSelectionAsPrimaryAction = true
        deliveryButton.menu = UIMenu(title: "Locations",
                                     children: [UIAction(title: "Home",image: UIImage(systemName: "house.fill"), state: .on, handler: { action in
            self.updateDeliveryButtonTitle(action.title)
        }),
                                                UIAction(title: "Work",image: UIImage(systemName: "briefcase.fill"), handler: { action in
            self.updateDeliveryButtonTitle(action.title)
        }),
                                                UIAction(title: "Vacation Home",image: UIImage(systemName: "beach.umbrella.fill"), handler: { action in
            self.updateDeliveryButtonTitle(action.title)
        })])
        deliveryButton.setTitle("Home ▼", for: .normal)
        deliveryButton.setTitleColor(UIColor(named:"AppOrange"), for: .normal)
        deliveryButton.titleLabel?.font = .init(name: "Metropolis-Bold", size: 18)
        deliveryOptionView.addSubview(deliveryButton)
        deliveryButton.leadingAnchor.constraint(equalTo: deliveryLabel.leadingAnchor).isActive = true
        deliveryButton.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor,constant: 2).isActive = true
        
        stackView.addArrangedSubview(searchView)
        searchView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10).isActive = true
        searchView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10).isActive = true
        
        let searchImage = UIImageView()
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.image = UIImage()
        searchImage.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchImage.tintColor = UIColor(named: "PlaceholderFont")
        searchImage.contentMode = .scaleAspectFill
        searchView.addSubview(searchImage)
        searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor,constant: 16).isActive = true
        searchImage.topAnchor.constraint(equalTo: searchView.topAnchor,constant: 12).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor,constant: -12).isActive = true
        searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor, multiplier: 1).isActive = true
        
        let searchTF = UITextField()
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.attributedPlaceholder = NSAttributedString(
            string: "Search Food",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "PlaceholderFont")!]
        )
        searchTF.font = .init(name: "Metropolis-Regular", size: 20)
        searchView.addSubview(searchTF)
        searchTF.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 8).isActive = true
        searchTF.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -16).isActive = true
        searchTF.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchTF.heightAnchor.constraint(equalTo: searchView.heightAnchor,multiplier: 0.8).isActive = true
        
        //MARK: KITCHENS CV
        let kitchenCVLayout = UICollectionViewFlowLayout()
        kitchenCVLayout.itemSize = CGSize(width: view.frame.width / 3.5, height: 140)
        kitchenCVLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        kitchenCVLayout.minimumLineSpacing = 10
        kitchenCVLayout.minimumInteritemSpacing = 10
        kitchenCVLayout.scrollDirection = .horizontal
        kitchensCV = UICollectionView(frame: .zero, collectionViewLayout: kitchenCVLayout)
        kitchensCV.translatesAutoresizingMaskIntoConstraints = false
        kitchensCV.backgroundColor = .white
        kitchensCV.showsVerticalScrollIndicator = false
        kitchensCV.showsHorizontalScrollIndicator = false
        kitchensCV.delegate = self
        kitchensCV.dataSource = self
        kitchensCV.register(KitchensCVCell.self, forCellWithReuseIdentifier: "kitchenCell")
        stackView.addArrangedSubview(kitchensCV)
        kitchensCV.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        //MARK: RESTAURANTS TV
        stackView.addArrangedSubview(popularTVView)
        
        let popularLabel = UILabel()
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.text = "Popular Restaurants"
        popularLabel.textColor = UIColor(named: "PrimaryFont")
        popularLabel.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel.textAlignment = .left
        popularLabel.hero.id = "titleLabel"
        popularTVView.addSubview(popularLabel)
        popularLabel.leftAnchor.constraint(equalTo: popularTVView.leftAnchor, constant: 10).isActive = true
        popularLabel.topAnchor.constraint(equalTo: popularTVView.topAnchor, constant: 10).isActive = true
        popularLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        let viewAllLabel = UILabel()
        viewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel.text = "View All"
        viewAllLabel.textColor = UIColor(named:"AppOrange")
        viewAllLabel.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel.textAlignment = .right
        popularTVView.addSubview(viewAllLabel)
        viewAllLabel.centerYAnchor.constraint(equalTo: popularLabel.centerYAnchor).isActive = true
        viewAllLabel.rightAnchor.constraint(equalTo: popularTVView.rightAnchor, constant: -10).isActive = true
        
        popularTV.translatesAutoresizingMaskIntoConstraints = false
        popularTV.delegate = self
        popularTV.dataSource = self
        popularTV.backgroundColor = .white
        popularTV.isScrollEnabled = false
        popularTV.separatorColor  = .clear
        popularTV.register(PopularRestaurantsTVCell.self, forCellReuseIdentifier: "popularTVCell")
        popularTVView.addSubview(popularTV)
        popularTV.leftAnchor.constraint(equalTo: popularTVView.leftAnchor).isActive = true
        popularTV.rightAnchor.constraint(equalTo: popularTVView.rightAnchor).isActive = true
        popularTV.topAnchor.constraint(equalTo: popularLabel.bottomAnchor,constant: 10).isActive = true
        popularTV.bottomAnchor.constraint(equalTo: popularTVView.bottomAnchor).isActive = true
        popularTV.rowHeight = (1400-45) / 5
        
        //MARK: RESTAURANTS CV
        stackView.addArrangedSubview(popularCVView)
        
        let popularLabel2 = UILabel()
        popularLabel2.translatesAutoresizingMaskIntoConstraints = false
        popularLabel2.text = "Most Popular"
        popularLabel2.textColor = UIColor(named: "PrimaryFont")
        popularLabel2.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel2.textAlignment = .left
        popularLabel2.hero.id = "titleLabel"
        popularCVView.addSubview(popularLabel2)
        popularLabel2.leftAnchor.constraint(equalTo: popularCVView.leftAnchor, constant: 10).isActive = true
        popularLabel2.topAnchor.constraint(equalTo: popularCVView.topAnchor, constant: 10).isActive = true
        popularLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel2 = UILabel()
        viewAllLabel2.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel2.text = "View All"
        viewAllLabel2.textColor = UIColor(named:"AppOrange")
        viewAllLabel2.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel2.textAlignment = .right
        popularCVView.addSubview(viewAllLabel2)
        viewAllLabel2.centerYAnchor.constraint(equalTo: popularLabel2.centerYAnchor).isActive = true
        viewAllLabel2.rightAnchor.constraint(equalTo: popularCVView.rightAnchor, constant: -10).isActive = true
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.itemSize = CGSize(width: view.frame.width * 0.6, height: 190)
        layout2.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout2.minimumLineSpacing = 20
        layout2.scrollDirection = .horizontal
        popularCV = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        popularCV.translatesAutoresizingMaskIntoConstraints = false
        popularCV.backgroundColor = .white
        popularCV.showsVerticalScrollIndicator = false
        popularCV.showsHorizontalScrollIndicator = false
        popularCV.delegate = self
        popularCV.dataSource = self
        popularCV.register(MostPopularCVCell.self, forCellWithReuseIdentifier: "popularCell")
        popularCVView.addSubview(popularCV)
        popularCV.leftAnchor.constraint(equalTo: popularCVView.leftAnchor).isActive = true
        popularCV.rightAnchor.constraint(equalTo: popularCVView.rightAnchor).isActive = true
        popularCV.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor,constant: 10).isActive = true
        popularCV.bottomAnchor.constraint(equalTo: popularCVView.bottomAnchor).isActive = true
        
        //MARK: RECENT ITEMS TV
        stackView.addArrangedSubview(recentItemsView)
        
        let popularLabel3 = UILabel()
        popularLabel3.translatesAutoresizingMaskIntoConstraints = false
        popularLabel3.text = "Recent Items"
        popularLabel3.textColor = UIColor(named: "PrimaryFont")
        popularLabel3.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel3.textAlignment = .left
        popularLabel3.hero.id = "titleLabel"
        recentItemsView.addSubview(popularLabel3)
        popularLabel3.leftAnchor.constraint(equalTo: recentItemsView.leftAnchor, constant: 10).isActive = true
        popularLabel3.topAnchor.constraint(equalTo: recentItemsView.topAnchor, constant: 10).isActive = true
        popularLabel3.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel3 = UILabel()
        viewAllLabel3.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel3.text = "View All"
        viewAllLabel3.textColor = UIColor(named:"AppOrange")
        viewAllLabel3.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel3.textAlignment = .right
        recentItemsView.addSubview(viewAllLabel3)
        viewAllLabel3.centerYAnchor.constraint(equalTo: popularLabel3.centerYAnchor).isActive = true
        viewAllLabel3.rightAnchor.constraint(equalTo: recentItemsView.rightAnchor, constant: -10).isActive = true
        
        recentTV.translatesAutoresizingMaskIntoConstraints = false
        recentTV.delegate = self
        recentTV.dataSource = self
        recentTV.backgroundColor = .white
        recentTV.isScrollEnabled = false
        recentTV.separatorColor  = .clear
        recentTV.register(RecentItemsTVCell.self, forCellReuseIdentifier: "recentItemsCell")
        recentItemsView.addSubview(recentTV)
        recentTV.leftAnchor.constraint(equalTo: recentItemsView.leftAnchor).isActive = true
        recentTV.rightAnchor.constraint(equalTo: recentItemsView.rightAnchor).isActive = true
        recentTV.topAnchor.constraint(equalTo: popularLabel3.bottomAnchor,constant: 10).isActive = true
        recentTV.bottomAnchor.constraint(equalTo: recentItemsView.bottomAnchor).isActive = true
        recentTV.rowHeight = (600-45) / 5
        
    }
    
    func createCustomNavigationView() {
        let customNavigationView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Good Morning!"
        titleLabel.textColor = UIColor(named: "PrimaryFont")
        titleLabel.font = .init(name: "Metropolis-ExtraBold", size: 22)
        titleLabel.textAlignment = .left
        customNavigationView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: customNavigationView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: customNavigationView.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: customNavigationView.bottomAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: customNavigationView.widthAnchor, multiplier: 0.5).isActive = true
        
        let cartImageView = UIImageView()
        cartImageView.translatesAutoresizingMaskIntoConstraints = false
        cartImageView.image = UIImage(systemName: "cart.fill")?.withRenderingMode(.alwaysTemplate)
        cartImageView.tintColor = UIColor(named: "AppOrange")
        cartImageView.contentMode = .scaleAspectFit
        customNavigationView.addSubview(cartImageView)
        cartImageView.topAnchor.constraint(equalTo: customNavigationView.topAnchor).isActive = true
        cartImageView.rightAnchor.constraint(equalTo: customNavigationView.rightAnchor).isActive = true
        cartImageView.bottomAnchor.constraint(equalTo: customNavigationView.bottomAnchor).isActive = true
        cartImageView.widthAnchor.constraint(equalTo: cartImageView.heightAnchor, multiplier: 1).isActive = true
        
        navigationItem.titleView = customNavigationView
    }
    
    func updateDeliveryButtonTitle(_ actionTitle : String) {
        deliveryButton.setTitle("\(actionTitle) ▼", for: .normal)
    }
    
}

