//
//  AboutView.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit

class AboutView: UIView {
    
    private let imageView: UIImageView
    private let infoLabel: UILabel
    private let infoLabel2: UILabel
    private let infoLabel3: UILabel
    
    init(image: UIImage? = nil, info1: String, info2: String? = nil, info3: String) {
        self.imageView = UIImageView()
        self.infoLabel = UILabel()
        self.infoLabel3 = UILabel()
        self.infoLabel2 = UILabel()
        
        super.init(frame: .zero)
        
        if info2 == nil {
            infoLabel2.isHidden = true
        }
        
        setupView()
        
        if let image = image {
            setImage(image)
        }
        setInfo1(info1)
        if let info2 = info2 {
            setInfo2(info2)
        }
        setInfo3(info3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(infoLabel)
        addSubview(infoLabel3)
        addSubview(infoLabel2)
        
        backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Poppins-Regular", size: 10)
        infoLabel.textColor = .black
        infoLabel.textAlignment = .center
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel2.font = UIFont(name: "Poppins-Regular", size: 10)
        infoLabel2.textColor = .black
        infoLabel2.textAlignment = .center
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        infoLabel3.font = UIFont(name: "Poppins-Regular", size: 8)
        infoLabel3.textColor = .gray
        infoLabel3.textAlignment = .center
        infoLabel3.translatesAutoresizingMaskIntoConstraints = false

        let viewWidth: CGFloat = 100
        let viewHeight: CGFloat = 80

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: viewWidth),
            heightAnchor.constraint(equalToConstant: viewHeight),

            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),

            infoLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            infoLabel2.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            infoLabel2.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            infoLabel2.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),

            infoLabel3.topAnchor.constraint(equalTo: infoLabel2.bottomAnchor, constant: 5),
            infoLabel3.leadingAnchor.constraint(equalTo: infoLabel2.leadingAnchor),
            infoLabel3.trailingAnchor.constraint(equalTo: infoLabel2.trailingAnchor),
            
            infoLabel3.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setInfo1(_ info: String) {
        infoLabel.text = info
    }
    
    func setInfo2(_ info: String) {
        infoLabel2.text = info
    }
    
    func setInfo3(_ info: String) {
        infoLabel3.text = info
    }
}
#Preview() {
    AboutView(image: UIImage(named: "weight")!, info1: "6.5 kg", info2: nil, info3: "weight")
}
