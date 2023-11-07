//
//  InfoView.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 5.11.2023.
//

import UIKit

class InfoView : UIView {
    
    let infoImage = UIImageView()
    let infoLabel = UILabel()
    
    init(frame: CGRect, image: UIImage, title: String) {
        super.init(frame: frame)
        infoImage.image = image.withRenderingMode(.alwaysTemplate)
        infoLabel.text = title
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        backgroundColor = .clear
        
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.tintColor = .white
        infoImage.contentMode = .scaleAspectFit
        addSubview(infoImage)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = .systemFont(ofSize: 16, weight: .regular)
        infoLabel.textAlignment = .center
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 1
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            infoImage.topAnchor.constraint(equalTo: topAnchor),
            infoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoImage.widthAnchor.constraint(equalToConstant: 25),
            infoImage.heightAnchor.constraint(equalToConstant: 25),
            
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -4),
            infoLabel.topAnchor.constraint(equalTo: infoImage.bottomAnchor, constant: 4),
            infoLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
}
