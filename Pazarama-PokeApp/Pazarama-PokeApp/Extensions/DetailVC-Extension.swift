//
//  PokemonDetailExtension.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import Foundation
import UIKit

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCell.identifier, for: indexPath) as! TypeCell
        cell.typeLabel.text = "Type"
        cell.typeLabel.backgroundColor = primaryColor
        cell.typeLabel.textColor = .white
        return cell
    }
    
    
}
