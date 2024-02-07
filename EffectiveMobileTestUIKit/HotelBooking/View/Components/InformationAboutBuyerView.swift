//
//  InformationAboutBuyerView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class InformationAboutBuyerView: UIView {
    
    let informationAboutBuyerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .blackColor
        label.text = "Информация о покупателе"
        label.textAlignment = .left
        return label
    }()
    
    let phoneNumberTextField = CustomTextFieldView(placeholderText: "Номер телефона")
    let emailTextField = CustomTextFieldView(placeholderText: "Почта")
    
    let privacyNoticeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        
        [informationAboutBuyerLabel, phoneNumberTextField, emailTextField, privacyNoticeLabel].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        informationAboutBuyerLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        privacyNoticeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            informationAboutBuyerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            informationAboutBuyerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            informationAboutBuyerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: informationAboutBuyerLabel.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            privacyNoticeLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            privacyNoticeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            privacyNoticeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            privacyNoticeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = InformationAboutBuyerView()
    view.backgroundColor = .cyan
    return view
}
