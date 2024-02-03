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
        tagView.text = "2242441"
        tagView.font = UIFont.systemFont(ofSize: 16)
        tagView.textColor = .grayColor
        tagView.backgroundColor = .grayBackgroundColor
        tagView.layer.cornerRadius = 5
        return tagView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tagView)
        setupConstraints()
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = TagView()
    view.backgroundColor = .blue
    return view
}
