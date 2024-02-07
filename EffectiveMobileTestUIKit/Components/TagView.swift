//
//  TagView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit

class TagView: UIView {
    
    let tagView: UILabel = {
        let tagView = UILabel()
        tagView.font = UIFont.systemFont(ofSize: 16)
        return tagView
    }()
    
    lazy var arrowRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        return imageView
    }()
    
    init(tagText: String, isButton: Bool = false) {
        super.init(frame: .zero)
        
        tagView.text = tagText
        layer.cornerRadius = 5
        
        backgroundColor = isButton ? .blueColor?.withAlphaComponent(0.1) : .grayBackgroundColor
        tagView.textColor = isButton ? .blueColor : .grayColor
        
        if !isButton {
            addSubview(tagView)
            setupConstraints()
        } else {
            addSubview(tagView)
            addSubview(arrowRight)
            setupWithArrowContraints()
        }
    }
    
    private func setupConstraints() {
        tagView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setupWithArrowContraints() {
        tagView.translatesAutoresizingMaskIntoConstraints = false
        arrowRight.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
//            arrowRight.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            arrowRight.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            arrowRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowRight.leadingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: 2),
            arrowRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = TagView(tagText: "Платный WI-FI в фойе", isButton: true)
    //view.backgroundColor = .blue
    return view
}
