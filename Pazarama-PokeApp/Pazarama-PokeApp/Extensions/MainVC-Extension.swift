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
            dropdownView.radioButton1.buttonImage.image = .radioButtonUnchecked
            dropdownView.radioButton2.buttonImage.image = .radioButtonUnchecked
            dropdownView.radioButton3.buttonImage.image = .radioButtonUnchecked
            dropdownView.radioButton4.buttonImage.image = .radioButtonUnchecked
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
        detailViewModel.fetchPokemonImage(pokemon.name, in: cell)
        cell.pokeNameLabel.text = pokemon.name.capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonService = APIManager()
        let detailVC = DetailVC(detailViewModel: PokemonDetailViewModel(pokemonService: pokemonService),index: indexPath.row)
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true)
    }
    
}
