//
//  MainInfoHotelView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 02.02.2024.
//

import UIKit

class MainInfoHotelView: UIView {
    
    // MARK: - Properties
    
    let carouselImageView = ImageCarouselView()
    let ratingView = RatingView()
    
    let hotelName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    let hotelAddresButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blueColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .blackColor
        return label
    }()
    
    let priceForItLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayColor
        return label
    }()
    
    let priceHStack: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.alignment = .lastBaseline
        return hStack
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        backgroundColor = .white
        [priceLabel, priceForItLabel].forEach { priceHStack.addArrangedSubview($0) }
        [carouselImageView, ratingView, hotelName, hotelAddresButton, priceHStack].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        carouselImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        hotelName.translatesAutoresizingMaskIntoConstraints = false
        hotelAddresButton.translatesAutoresizingMaskIntoConstraints = false
        priceHStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselImageView.topAnchor.constraint(equalTo: topAnchor),
            carouselImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            carouselImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            carouselImageView.heightAnchor.constraint(equalTo: carouselImageView.widthAnchor, multiplier: 0.75),
            
            ratingView.topAnchor.constraint(equalTo: carouselImageView.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            hotelName.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            hotelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            hotelAddresButton.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 8),
            hotelAddresButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            priceHStack.topAnchor.constraint(equalTo: hotelAddresButton.bottomAnchor, constant: 16),
            priceHStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceHStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = MainInfoHotelView()
    view.backgroundColor = .cyan
    return view
}
