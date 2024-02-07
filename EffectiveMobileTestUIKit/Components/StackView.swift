//
//  StackView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class StackView: UIStackView {
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayColor
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blackColor
        label.numberOfLines = 0
        return label
    }()
    
    init(leftText: String, rightText: String, alignmentRightText: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.leftLabel.text = leftText
        self.rightLabel.text = rightText
        self.rightLabel.textAlignment = alignmentRightText
        
        axis = .horizontal
        alignment = .firstBaseline
        
        addArrangedSubview(leftLabel)
        addArrangedSubview(rightLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
