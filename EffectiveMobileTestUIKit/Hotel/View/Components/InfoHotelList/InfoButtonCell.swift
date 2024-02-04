//
//  InfoButtonCell.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class InfoButtonCell: UITableViewCell {
    let image: UIImageView = {
        let imageView = UIImageView()
        //imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blackColor
        return label
    }()
    
    let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .grayColor
        return label
    }()
    
    let arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .blackColor
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        separatorInset = .init(top: 0, left: 40, bottom: 0, right: 25)
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(aboutHotelLabel)
        addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 24),
            image.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            
            aboutHotelLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            aboutHotelLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            arrowIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            arrowIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
