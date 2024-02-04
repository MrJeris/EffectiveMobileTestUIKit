//
//  HotelDetailButton.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class HotelDetailButton: UIView {
    let hStack: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 12
        hStack.backgroundColor = .blueColor?.withAlphaComponent(0.1)
        hStack.layer.cornerRadius = 5
        hStack.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        hStack.isLayoutMarginsRelativeArrangement = true
        return hStack
    }()
    
    let moreDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Подробнее о номере"
        label.textColor = .blueColor
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let arrowRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [moreDetailLabel, arrowRight].forEach { hStack.addArrangedSubview($0) }
        
        addSubview(hStack)
        setupConstraints()
    }
    
    private func setupConstraints() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            hStack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = HotelDetailButton()
    view.backgroundColor = .white
    return view
}
