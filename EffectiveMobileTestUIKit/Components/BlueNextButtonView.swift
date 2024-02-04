//
//  BlueNextButtonView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 02.02.2024.
//

import UIKit

class BlueNextButtonView: UIView {
    
    var action: (() -> Void)?
    
    let buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 15
        button.contentHorizontalAlignment = .center
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    init(title titleButton: String) {
        super.init(frame: .zero)
        addSubview(buttonView)
        
        backgroundColor = .white
        
        buttonView.setTitle(titleButton, for: .normal)
        setupConstraints()
    }
    
    @objc func buttonTap() {
        action?()
        print("Click")
    }
    
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
