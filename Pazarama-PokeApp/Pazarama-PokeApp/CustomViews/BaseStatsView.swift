//
//  BaseStatsView.swift
//  Pazarama-PokeApp
//
//  Created by Mehmet Kaan on 3.11.2023.
//

import UIKit

class BaseStatsView: UIView {
    // Label 1
    let statName: UILabel = {
        let label = UILabel()
        label.text = "Label 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Divider
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Label 2
    let statValue: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // ProgressBar
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    init(label1Text: String, label2Text: String, progress: Float) {
            super.init(frame: .zero)
            
            statName.text = label1Text
            statValue.text = label2Text
        progressBar.progress = progress

            setupViews()
        }

    func setupViews() {
        addSubview(statName)
        addSubview(divider)
        addSubview(statValue)
        addSubview(progressBar)

        NSLayoutConstraint.activate([
            statName.leadingAnchor.constraint(equalTo: leadingAnchor),
            statName.centerYAnchor.constraint(equalTo: centerYAnchor),
            statName.widthAnchor.constraint(equalToConstant: 45),

            divider.leadingAnchor.constraint(equalTo: statName.trailingAnchor, constant: 3),
            divider.heightAnchor.constraint(equalTo: heightAnchor),
            divider.widthAnchor.constraint(equalToConstant: 2),

            statValue.leadingAnchor.constraint(equalTo: divider.trailingAnchor, constant: 8),
            statValue.centerYAnchor.constraint(equalTo: centerYAnchor),

            progressBar.leadingAnchor.constraint(equalTo: statValue.trailingAnchor, constant: 8),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            progressBar.centerYAnchor.constraint(equalTo: centerYAnchor)
//            progressBar.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

#Preview() {
    BaseStatsView(label1Text: "SDEF", label2Text: "45", progress: 45 / 100)
}
