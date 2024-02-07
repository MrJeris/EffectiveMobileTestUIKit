//
//  CustomTextFieldView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class CustomTextFieldView: UIView, UITextFieldDelegate {
    
    private var placeholderYAnchorConstraint: NSLayoutConstraint!
    private var placeholderLeadingAnchor: NSLayoutConstraint!
    
    private var textFieldYAnchorConstraint: NSLayoutConstraint!
    
    private let placeholder: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .blackColor
        textField.font = .systemFont(ofSize: 17)
        return textField
    }()
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        
        addSubview(placeholder)
        addSubview(textField)
        
        textField.delegate = self
        
        placeholder.text = placeholderText
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 249/255, alpha: 1)
        layer.cornerRadius = 10
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        placeholderLeadingAnchor = placeholder.leadingAnchor.constraint(equalTo: textField.leadingAnchor)
        placeholderYAnchorConstraint = placeholder.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        
        textFieldYAnchorConstraint = textField.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textFieldYAnchorConstraint,
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            placeholderLeadingAnchor,
            placeholderYAnchorConstraint,
            
            heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeholderYAnchorConstraint.constant = -18
        placeholderLeadingAnchor.constant = -placeholder.frame.width * 0.15
        textFieldYAnchorConstraint.constant = 6
        performAnimation(transform: CGAffineTransform(scaleX: 0.7, y: 0.7))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            placeholderYAnchorConstraint.constant = 0
            placeholderLeadingAnchor.constant = 0
            textFieldYAnchorConstraint.constant = 0
            performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
        }
    }
    
    private func performAnimation(transform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: {
                self.placeholder.transform = transform
                self.layoutIfNeeded()
            }
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview {
    let view = CustomTextFieldView(placeholderText: "Номер телефона")
    
    return view
}
