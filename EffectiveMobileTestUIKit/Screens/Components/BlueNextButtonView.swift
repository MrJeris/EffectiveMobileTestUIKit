//
//  BlueNextButtonView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 02.02.2024.
//

import UIKit

class BlueNextButtonView: UIView {
    
    // MARK: - Properties
    
    // Замыкание для обработки нажатия на кнопку
    var action: (() -> Void)?
    
    // Кнопка
    let buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 15
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // MARK: - Initialization
    
    init(title titleButton: String) {
        super.init(frame: .zero)
        setupButton(titleButton: titleButton)
    }
    
    // MARK: - Setup
    
    private func setupButton(titleButton: String) {
        addSubview(buttonView)
        backgroundColor = .white
        
        buttonView.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        buttonView.setTitle(titleButton, for: .normal)
        setupConstraints()
    }
    
    // MARK: - Actions
    //Обработка нажатия на кнопку
    @objc func buttonTap() {
        action?()
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: topAnchor),
            buttonView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = BlueNextButtonView(title: "К выбору номера")
    return view
}
