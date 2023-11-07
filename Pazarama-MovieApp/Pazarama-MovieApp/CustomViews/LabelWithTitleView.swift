//
//  DetailView.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import UIKit

class LabelWithTitleView : UIView {
    
    let titleLabel = UILabel()
    let textLabel = UILabel()
    
    init(title: String, text: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        textLabel.text = text
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        addSubview(titleLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = .systemFont(ofSize: 18, weight: .regular)
        textLabel.textColor = .white
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}
