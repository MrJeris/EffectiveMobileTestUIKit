//
//  PaymentDetailsView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class PaymentDetailsView: UIView {
    let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 16
        return vStack
    }()
    
    let tourPrice = StackView(leftText: "Тур", rightText: "", alignmentRightText: .right)
    let fuelCharge = StackView(leftText: "Топливный сбор", rightText: "", alignmentRightText: .right)
    let serviceCharge = StackView(leftText: "К оплате", rightText: "", alignmentRightText: .right)
    let totalPrice = StackView(leftText: "К оплате", rightText: "", alignmentRightText: .right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        totalPrice.rightLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        totalPrice.rightLabel.textColor = .blueColor
        
        [tourPrice, fuelCharge, serviceCharge, totalPrice].forEach { vStack.addArrangedSubview($0) }
        addSubview(vStack)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = PaymentDetailsView()
    view.backgroundColor = .orange
    view.tourPrice.rightLabel.text = "186 600 Р"
    view.fuelCharge.rightLabel.text = "9 300 Р"
    view.serviceCharge.rightLabel.text = "2 136 Р"
    view.totalPrice.rightLabel.text = "198 036 Р"
    return view
}
