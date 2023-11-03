//
//  ViewController.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    
    var shownArray = mockArray
    
    let dropdownView = SortDropdownView()
    
    var pokeCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .mainRed
        
        let titleView = UIView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = .clear
        view.addSubview(titleView)
        titleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let pokeball = UIImageView()
        pokeball.translatesAutoresizingMaskIntoConstraints = false
        pokeball.image = .pokeball.withRenderingMode(.alwaysTemplate)
        pokeball.tintColor = .white
        pokeball.contentMode = .scaleAspectFill
        titleView.addSubview(pokeball)
        pokeball.leftAnchor.constraint(equalTo: titleView.leftAnchor,constant: 12).isActive = true
        pokeball.topAnchor.constraint(equalTo: titleView.topAnchor,constant: 12).isActive = true
        pokeball.widthAnchor.constraint(equalToConstant: 24).isActive = true
        pokeball.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Pokédex"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: pokeball.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: pokeball.rightAnchor, constant: 16).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: pokeball.heightAnchor, multiplier: 1).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
        
        let searchView = UIView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 20
        titleView.addSubview(searchView)
        searchView.leftAnchor.constraint(equalTo: pokeball.leftAnchor).isActive = true
        searchView.topAnchor.constraint(equalTo: pokeball.bottomAnchor,constant: 12).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        
        let searchImage = UIImageView()
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchImage.tintColor = .mainRed
        searchImage.contentMode = .scaleAspectFill
        searchView.addSubview(searchImage)
        searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImage.leftAnchor.constraint(equalTo: searchView.leftAnchor,constant: 16).isActive = true
        searchImage.topAnchor.constraint(equalTo: searchView.topAnchor,constant: 8).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor,constant: -8).isActive = true
        searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor, multiplier: 1).isActive = true
        
        let searchTF = UITextField()
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        searchTF.font = .systemFont(ofSize: 16, weight: .regular)
        searchTF.textColor = .black
        searchTF.tintColor = .mainRed
        searchTF.delegate = self
        searchView.addSubview(searchTF)
        searchTF.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 8).isActive = true
        searchTF.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -16).isActive = true
        searchTF.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchTF.heightAnchor.constraint(equalTo: searchView.heightAnchor,multiplier: 0.8).isActive = true
        
        let sortButton = UIButton()
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.setImage(.tag, for: .normal)
        sortButton.imageView?.contentMode = .scaleAspectFill
        sortButton.backgroundColor = .white
        sortButton.layer.cornerRadius = 20
        sortButton.addTarget(self, action: #selector(sortClicked), for: .touchUpInside)
        titleView.addSubview(sortButton)
        sortButton.heightAnchor.constraint(equalTo: searchView.heightAnchor, multiplier: 1).isActive = true
        sortButton.leftAnchor.constraint(equalTo: searchView.rightAnchor, constant: 16).isActive = true
        sortButton.widthAnchor.constraint(equalTo: sortButton.heightAnchor, multiplier: 1).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 8
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 8).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 8).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -8).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.itemSize = CGSize(width: 110, height: 110)
        cvLayout.sectionInset = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
        cvLayout.minimumLineSpacing = 8
        cvLayout.minimumInteritemSpacing = 8
        cvLayout.scrollDirection = .vertical
        pokeCV = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        pokeCV.translatesAutoresizingMaskIntoConstraints = false
        pokeCV.backgroundColor = .clear
        pokeCV.showsVerticalScrollIndicator = false
        pokeCV.showsHorizontalScrollIndicator = false
        pokeCV.delegate = self
        pokeCV.dataSource = self
        pokeCV.register(PokeCell.self, forCellWithReuseIdentifier: "pokeCell")
        mainView.addSubview(pokeCV)
        pokeCV.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        pokeCV.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        pokeCV.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        pokeCV.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        pokeCV.reloadData()
        
        dropdownView.translatesAutoresizingMaskIntoConstraints = false
        let tapG1 = UITapGestureRecognizer(target: self, action: #selector(radio1Tapped))
        dropdownView.radioButton1.addGestureRecognizer(tapG1)
        
        let tapG2 = UITapGestureRecognizer(target: self, action: #selector(radio2Tapped))
        dropdownView.radioButton2.addGestureRecognizer(tapG2)
        
        let tapG3 = UITapGestureRecognizer(target: self, action: #selector(radio3Tapped))
        dropdownView.radioButton3.addGestureRecognizer(tapG3)
        
        let tapG4 = UITapGestureRecognizer(target: self, action: #selector(radio4Tapped))
        dropdownView.radioButton4.addGestureRecognizer(tapG4)
        view.addSubview(dropdownView)
        dropdownView.rightAnchor.constraint(equalTo: sortButton.rightAnchor).isActive = true
        dropdownView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dropdownView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        dropdownView.topAnchor.constraint(equalTo: sortButton.bottomAnchor,constant: 10).isActive = true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        //APPLY SEARCH
        if searchText == "" {
            shownArray = mockArray
        } else {
            shownArray = mockArray.filter({ poke in
                poke.name.localizedCaseInsensitiveContains(searchText)
            })
        }
        
        pokeCV.reloadData()
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shownArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as! PokeCell
        let pokemon = shownArray[indexPath.row]
        cell.pokeNumberLabel.text = "#\(String(format: "%03d", pokemon.number))"
        cell.pokeImageView.image = .bulbasaur
        cell.pokeNameLabel.text = pokemon.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true)
    }
    
    @objc func sortClicked() {
        dropdownView.isHidden = !dropdownView.isHidden
    }
    
    @objc func radio1Tapped() {
        dropdownView.radioButton1.buttonImage.image = .radioButtonChecked
        dropdownView.radioButton2.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton3.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton4.buttonImage.image = .radioButtonUnchecked
        shownArray = shownArray.sorted(by: { p1, p2 in
            p1.number < p2.number
        })
        pokeCV.reloadData()
    }
    
    @objc func radio2Tapped() {
        dropdownView.radioButton1.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton2.buttonImage.image = .radioButtonChecked
        dropdownView.radioButton3.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton4.buttonImage.image = .radioButtonUnchecked
        shownArray = shownArray.sorted(by: { p1, p2 in
            p1.number > p2.number
        })
        pokeCV.reloadData()
    }
    
    @objc func radio3Tapped() {
        dropdownView.radioButton1.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton2.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton3.buttonImage.image = .radioButtonChecked
        dropdownView.radioButton4.buttonImage.image = .radioButtonUnchecked
        shownArray = shownArray.sorted(by: { p1, p2 in
            p1.name < p2.name
        })
        pokeCV.reloadData()
    }
    
    @objc func radio4Tapped() {
        dropdownView.radioButton1.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton2.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton3.buttonImage.image = .radioButtonUnchecked
        dropdownView.radioButton4.buttonImage.image = .radioButtonChecked
        shownArray = shownArray.sorted(by: { p1, p2 in
            p1.name > p2.name
        })
        pokeCV.reloadData()
    }
    
    
}

#Preview {
    MainVC()
}