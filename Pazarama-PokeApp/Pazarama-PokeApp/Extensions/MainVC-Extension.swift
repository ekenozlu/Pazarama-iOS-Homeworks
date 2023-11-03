//
//  MainVC-Extension.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

extension MainVC : UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if searchText == "" {
            shownArray = baseArray
        } else {
            shownArray = baseArray.filter({ poke in
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
        cell.pokeImageView.sd_setImage(with: URL(string: self.pokemonImageURL))
        cell.pokeNameLabel.text = pokemon.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true)
    }
    
}
