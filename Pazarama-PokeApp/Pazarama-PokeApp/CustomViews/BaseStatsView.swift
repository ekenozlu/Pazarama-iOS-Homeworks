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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label 1"
        label.textAlignment = .right
        label.font = UIFont(name: "Poppins-Black", size: 16)
        label.textColor = .black
        label.numberOfLines = 1
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label 2"
        label.textAlignment = .right
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()

    // ProgressBar
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()

    init(frame: CGRect,label1Text: String, label2Text: String, progress: Float,primColor: UIColor, secColor: UIColor) {
        super.init(frame: frame)
        statName.text = label1Text
        statName.textColor = primColor
        statValue.text = label2Text
        progressBar.progress = progress
        progressBar.progressTintColor = primColor
        progressBar.trackTintColor = secColor

        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
            statValue.widthAnchor.constraint(equalToConstant: 30),

            progressBar.leadingAnchor.constraint(equalTo: statValue.trailingAnchor, constant: 8),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            progressBar.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

#Preview() {
    BaseStatsView(frame: .zero, label1Text: "SDEF", label2Text: "145", progress: 145 / 225,primColor: .red,secColor: .green)
}

