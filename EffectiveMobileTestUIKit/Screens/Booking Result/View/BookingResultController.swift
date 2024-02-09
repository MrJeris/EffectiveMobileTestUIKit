//
//  BookingResultController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import Combine
import UIKit
import SwiftUI

class BookingResultController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: BookingResultViewModel?
    private var cancellables = Set<AnyCancellable>()
    
//    private func bindViewModel() {
//        viewModel?.$hotel
//            .sink { [weak self] hotel in
//                DispatchQueue.main.async {
//                    // Обновление интерфейса на основе данных из ViewModel
//                    self?.mainInfoSection.ratingView.ratingLabel.text = "\(hotel.rating) \(hotel.ratingName)"
//                    self?.mainInfoSection.hotelName.text = hotel.name
//                    self?.mainInfoSection.hotelAddresButton.setTitle(hotel.adress, for: .normal)
//                    self?.mainInfoSection.priceLabel.text =  "от \(hotel.minimalPrice) Р"
//                    self?.mainInfoSection.priceForItLabel.text = hotel.priceForIt
//
//                    self?.detailInfoSection.tagListView.configure(for: hotel.aboutTheHotel.peculiarities)
//                    self?.detailInfoSection.descriptionLabel.text = hotel.aboutTheHotel.description
//                }
//            }
//            .store(in: &cancellables)
//    }
    
    // MARK: - UI Elements
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .partyPopper)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let orderAcceptedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .blackColor
        label.textAlignment = .center
        label.text = "Ваш заказ принят в работу"
        return label
    }()
    
    let confirmationProcessingInformationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .grayColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
        return label
    }()
    
    private let divider: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return uiView
    }()
    
    let button = BlueNextButtonView(title: "Супер!")
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
        
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        title = "Заказ оплачен"
        view.backgroundColor = .white
        
        [imageView, orderAcceptedLabel, confirmationProcessingInformationLabel, divider, button].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        orderAcceptedLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmationProcessingInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 122),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 94),
            imageView.widthAnchor.constraint(equalToConstant: 94),
            
            orderAcceptedLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            orderAcceptedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            orderAcceptedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            confirmationProcessingInformationLabel.topAnchor.constraint(equalTo: orderAcceptedLabel.bottomAnchor, constant: 20),
            confirmationProcessingInformationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmationProcessingInformationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            

            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            button.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupButtomAction() {
        button.action = {
            self.viewModel?.goToMainScreen()
        }
    }
}

private struct BookingResultViewPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = BookingResultController()
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

#Preview {
    BookingResultViewPreview()
}
