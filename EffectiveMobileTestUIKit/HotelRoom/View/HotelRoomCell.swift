//
//  HotelRoomCell.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 03.02.2024.
//

import UIKit

class HotelRoomCell: UITableViewCell {
    let carouselView = ImageCarouselView()
    
    let hotelName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .blackColor
        label.numberOfLines = 0
        return label
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
    
    let blueNextButton = BlueNextButtonView(title: "Выбрать номер")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [priceLabel, priceForItLabel].forEach { priceHStack.addArrangedSubview($0) }
        [carouselView, hotelName, priceHStack, blueNextButton].forEach { addSubview($0) }
        
        backgroundColor = .white
        selectionStyle = .none
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 12
    }
    
    func setupConstraints() {
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        hotelName.translatesAutoresizingMaskIntoConstraints = false
        priceHStack.translatesAutoresizingMaskIntoConstraints = false
        blueNextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            carouselView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            carouselView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            carouselView.heightAnchor.constraint(equalTo: carouselView.widthAnchor, multiplier: 0.75),
            
            hotelName.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 8),
            hotelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hotelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            priceHStack.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 16),
            priceHStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            blueNextButton.topAnchor.constraint(equalTo: priceHStack.bottomAnchor, constant: 16),
            blueNextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            blueNextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            blueNextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
