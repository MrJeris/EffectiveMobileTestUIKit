//
//  RatingNameHotelView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class RatingNameHotelView: UIView {
    
    let ratingView = RatingView()
    
    let hotelName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blackColor
        label.numberOfLines = 2
        return label
    }()
    
    let hotelAddresButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blueColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 15
        
        [ratingView, hotelName, hotelAddresButton].forEach { addSubview($0) }
        setupConstraints()
    }
    
    func setupConstraints() {
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        hotelName.translatesAutoresizingMaskIntoConstraints = false
        hotelAddresButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            hotelName.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            hotelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hotelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            hotelAddresButton.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 4),
            hotelAddresButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hotelAddresButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hotelAddresButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = RatingNameHotelView()
    view.hotelName.text = "Steigenberger Makadi"
    view.ratingView.ratingLabel.text = "\(5) Превосходно"
    view.hotelAddresButton.setTitle("Madinat Makadi, Safaga Road, Makadi Bay, Египет", for: .normal)
    view.backgroundColor = .gray
    return view
}
