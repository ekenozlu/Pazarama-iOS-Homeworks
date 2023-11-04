//
//  SortView.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

class SortDropdownView : UIView {
    
    let radioButton1 = RadioButtonView(frame: .zero, image: .radioButtonUnchecked, text: "Number (↑)")
    let radioButton2 = RadioButtonView(frame: .zero, image: .radioButtonUnchecked, text: "Number (↓)")
    let radioButton3 = RadioButtonView(frame: .zero, image: .radioButtonUnchecked, text: "Name (A→Z)")
    let radioButton4 = RadioButtonView(frame: .zero, image: .radioButtonUnchecked, text: "Name (Z→A)")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mainRed
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        isHidden = true
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sort by:"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Poppins-Black", size: 16)
        addSubview(label)
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        label.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        let innerView = UIStackView()
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 8
        innerView.axis = .vertical
        innerView.distribution = .fillEqually
        addSubview(innerView)
        innerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        innerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        innerView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4).isActive = true
        innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        innerView.addArrangedSubview(radioButton1)
        radioButton1.leftAnchor.constraint(equalTo: innerView.leftAnchor).isActive = true
        radioButton1.rightAnchor.constraint(equalTo: innerView.rightAnchor).isActive = true
        
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        innerView.addArrangedSubview(radioButton2)
        radioButton2.leftAnchor.constraint(equalTo: innerView.leftAnchor).isActive = true
        radioButton2.rightAnchor.constraint(equalTo: innerView.rightAnchor).isActive = true
        
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        innerView.addArrangedSubview(radioButton3)
        radioButton3.leftAnchor.constraint(equalTo: innerView.leftAnchor).isActive = true
        radioButton3.rightAnchor.constraint(equalTo: innerView.rightAnchor).isActive = true
        
        radioButton4.translatesAutoresizingMaskIntoConstraints = false
        innerView.addArrangedSubview(radioButton4)
        radioButton4.leftAnchor.constraint(equalTo: innerView.leftAnchor).isActive = true
        radioButton4.rightAnchor.constraint(equalTo: innerView.rightAnchor).isActive = true
        
    }
    
}
