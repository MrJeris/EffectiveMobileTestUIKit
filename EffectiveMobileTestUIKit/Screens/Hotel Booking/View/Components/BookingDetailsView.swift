//
//  BookingDetailsView.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import UIKit

class BookingDetailsView: UIView {
    
    let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 16
        vStack.alignment = .fill
        return vStack
    }()
    
    let departure = StackView(leftText: "Вылет из", rightText: "", alignmentRightText: .left)
    let arrivalCountry = StackView(leftText: "Страна, город", rightText: "", alignmentRightText: .left)
    let tourDateStartStop = StackView(leftText: "Даты", rightText: "", alignmentRightText: .left)
    let hotelName = StackView(leftText: "Отель", rightText: "", alignmentRightText: .left)
    let numberOfNights = StackView(leftText: "Кол-во ночей", rightText: "", alignmentRightText: .left)
    let room = StackView(leftText: "Номер", rightText: "", alignmentRightText: .left)
    let nutrition = StackView(leftText: "Питание", rightText: "", alignmentRightText: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        
        addSubview(vStack)
        [departure, arrivalCountry, tourDateStartStop, numberOfNights, hotelName, room, nutrition].forEach { vStack.addArrangedSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview {
    let view = BookingDetailsView()
    view.departure.rightLabel.text = "Санкт-Петербург"
    view.arrivalCountry.rightLabel.text = "Египет, Хургада"
    view.tourDateStartStop.rightLabel.text = "\("19.09.2023") - \("27.09.2023")"
    view.numberOfNights.rightLabel.text = "7 ночей"
    view.hotelName.rightLabel.text = "Steignberger Makadi"
    view.room.rightLabel.text = "Стандартный с видом на бассейн или сад"
    view.nutrition.rightLabel.text = "Всё включено"
    
    view.backgroundColor = .orange
    return view
}
