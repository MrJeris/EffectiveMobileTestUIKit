//
//  DetailInfoHotelView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 02.02.2024.
//

import UIKit

class DetailInfoHotelView: UIView {
    let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .blackColor
        label.text = "Об отеле"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blackColor?.withAlphaComponent(0.9)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let infoHotelList = InfoHotelListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
        backgroundColor = .white
        infoHotelList.layer.cornerRadius = 15
        
        [aboutHotelLabel, descriptionLabel, infoHotelList].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        infoHotelList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutHotelLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutHotelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: aboutHotelLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            infoHotelList.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            infoHotelList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoHotelList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoHotelList.heightAnchor.constraint(equalTo: infoHotelList.widthAnchor, multiplier: 0.497),
            infoHotelList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure() {
        descriptionLabel.text = "Отель VIP-класса с собсвенным гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview {
    let view = DetailInfoHotelView()
    view.backgroundColor = .cyan
    return view
}