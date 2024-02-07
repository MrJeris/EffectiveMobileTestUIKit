//
//  TouristInformationView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class TouristInformationView: UIView {
    
    // MARK: - Properties
    
    var isVStackVisible = true
    
    
    // MARK: UI Components
    
    private let touristNumber: UILabel = {
        // Конфигурация метки для номера туриста
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    private let visibilityToggleButton: UIButton = {
        // Конфигурация кнопки для переключения видимости
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.up")
        button.setImage(image, for: .normal)
        button.backgroundColor = .blueColor?.withAlphaComponent(0.1)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(toggleButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let hStack: UIStackView = {
        // Горизонтальный стек
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fill
        return hStack
    }()
    
    let vStack: UIStackView = {
        // Вертикальный стек для текстовых полей
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.distribution = .fill
        vStack.alignment = .fill
        return vStack
    }()
    
    // MARK: Text Fields
    
    let firstNameTextField = CustomTextFieldView(placeholderText: "Имя")
    let lastNameTextField = CustomTextFieldView(placeholderText: "Фамилия")
    let dateOfBirthTextField = CustomTextFieldView(placeholderText: "Дата рождения")
    let citizenshipTextField = CustomTextFieldView(placeholderText: "Гражданство")
    let passportNumberTextField = CustomTextFieldView(placeholderText: "Номер загранпаспорта")
    let passportExpirationDateTextField = CustomTextFieldView(placeholderText: "Срок действия загранпаспорта")
    
    // MARK: - Initialization
    
    init(touristNumber: String) {
        super.init(frame: .zero)
        
        // Конфигурация основных параметров вида
        self.touristNumber.text = touristNumber
        backgroundColor = .white
        layer.cornerRadius = 12
        frame.size.width = UIScreen.main.bounds.width
        
        // Добавление текстовых полей в вертикальный стек
        [firstNameTextField, lastNameTextField, dateOfBirthTextField, citizenshipTextField, passportNumberTextField, passportExpirationDateTextField].forEach { vStack.addArrangedSubview($0) }
        
        // Добавление метки номера туриста и кнопки видимости в горизонтальный стек
        [self.touristNumber, visibilityToggleButton].forEach { hStack.addArrangedSubview($0) }
        
        // Добавление стеков на вью
        addSubview(hStack)
        addSubview(vStack)
        
        //Настройка ограничений
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private var vStackHeightConstraint: NSLayoutConstraint!
    private var hStackBottomConstraint: NSLayoutConstraint!
    
    private func setupConstraints() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            vStack.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 16),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            visibilityToggleButton.heightAnchor.constraint(equalToConstant: 32),
            visibilityToggleButton.widthAnchor.constraint(equalToConstant: 32),
        ])
        
        vStackHeightConstraint = vStack.heightAnchor.constraint(equalToConstant: vStackIntrinsicHeight)
        hStackBottomConstraint = hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        vStackHeightConstraint.isActive = true
    }
    
    // MARK: - User Interaction & Animation
    
    @objc private func toggleButtonPressed() {
        isVStackVisible.toggle()
        
        UIView.animate(withDuration: 0.4) {
            self.visibilityToggleButton.imageView?.transform = self.isVStackVisible ? .identity : CGAffineTransform(rotationAngle: .pi)
            self.updateVStackVisibility()
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        }
    }
    
    // MARK: - Update Visibility
    
    private func updateVStackVisibility() {
        vStackHeightConstraint.constant = isVStackVisible ? vStackIntrinsicHeight : 0
        hStackBottomConstraint.isActive = !isVStackVisible
        vStack.isHidden = !isVStackVisible
        vStack.alpha = isVStackVisible ? 1.0 : 0.0
    }

    // MARK: - Helper Method

    private var vStackIntrinsicHeight: CGFloat {
        //Размер одного элемента TextField
        let heightTextField: CGFloat = 52
        //Количество всех TextField в vStack
        let numberOfSubviews = vStack.arrangedSubviews.count
        //Высота всего vStack (количество * высоту одного + Сумма промежутков между элементами)
        return CGFloat(numberOfSubviews) * heightTextField + CGFloat(numberOfSubviews - 1) * vStack.spacing
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    let view = TouristInformationView(touristNumber: "Первый турист")
    view.backgroundColor = .orange
    return view
}
