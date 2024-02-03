//
//  RatingView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class RatingView: UIView {
    let starAndRatingLabel: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 2
        hStack.alignment = .center
        hStack.backgroundColor = .yellowBackground.withAlphaComponent(0.2)
        hStack.layer.cornerRadius = 5
        hStack.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        hStack.isLayoutMarginsRelativeArrangement = true
        return hStack
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .orangeColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .orangeColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        [starImage, ratingLabel].forEach { starAndRatingLabel.addArrangedSubview($0) }
        
        addSubview(starAndRatingLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        starAndRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starAndRatingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            starAndRatingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            starAndRatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            starAndRatingLabel.topAnchor.constraint(equalTo: topAnchor),
            starAndRatingLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = RatingView()
    view.backgroundColor = .blue
    return view
}
