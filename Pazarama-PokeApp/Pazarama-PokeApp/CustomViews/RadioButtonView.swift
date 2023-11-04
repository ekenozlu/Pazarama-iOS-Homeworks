//
//  RadioButtonView.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

class RadioButtonView : UIView {
    
    let buttonImage = UIImageView()
    let buttonLabel = UILabel()
    
    init(frame: CGRect, image: UIImage, text: String) {
        super.init(frame: frame)
        buttonImage.image = image
        buttonLabel.text = text
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        backgroundColor = .clear
        isUserInteractionEnabled = true
        
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.contentMode = .scaleAspectFill
        buttonImage.backgroundColor = .clear
        addSubview(buttonImage)
        buttonImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        buttonImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        buttonLabel.textColor = .black
        buttonLabel.textAlignment = .right
        addSubview(buttonLabel)
        buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        buttonLabel.leftAnchor.constraint(equalTo: buttonImage.rightAnchor, constant: 8).isActive = true
        buttonLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        
    }
    
    
}
