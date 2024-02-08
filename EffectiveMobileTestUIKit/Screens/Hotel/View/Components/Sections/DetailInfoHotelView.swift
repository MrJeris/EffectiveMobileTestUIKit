//
//  DetailInfoHotelView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 02.02.2024.
//

import UIKit

class DetailInfoHotelView: UIView {
    
    // MARK: - Properties
    
    let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .blackColor
        label.text = "Об отеле"
        return label
    }()
    
    let tagListView = TagListView()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blackColor?.withAlphaComponent(0.9)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let infoHotelList = InfoHotelListView()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        backgroundColor = .white
        infoHotelList.layer.cornerRadius = 15
        [aboutHotelLabel, tagListView, descriptionLabel, infoHotelList].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        tagListView.translatesAutoresizingMaskIntoConstraints = false
        infoHotelList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutHotelLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutHotelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            tagListView.topAnchor.constraint(equalTo: aboutHotelLabel.bottomAnchor, constant: 16),
            tagListView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tagListView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: tagListView.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            infoHotelList.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            infoHotelList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoHotelList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoHotelList.heightAnchor.constraint(equalToConstant: 179),
            infoHotelList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview {
    let view = DetailInfoHotelView()
    view.backgroundColor = .cyan
    view.tagListView.configure(for: ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"])
    return view
}
