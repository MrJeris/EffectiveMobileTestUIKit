//
//  ViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 01.02.2024.
//

import UIKit
import Combine
import SwiftUI

class HotelViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: HotelViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Subviews
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let mainInfoSection = MainInfoHotelView()
    let detailInfoSection = DetailInfoHotelView()
    
    let divider: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return uiView
    }()
    
    let blueNextButton = BlueNextButtonView(title: "К выбору номера")
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .grayBackgroundColor
        return containerView
    }()
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupSubviews()
        setupConstraints()
        
        bindViewModel()
    }
    
    // MARK: - Setup Methods
    
    private func setupSubviews() {
        view.backgroundColor = .grayBackgroundColor
        scrollView.frame = view.bounds
        
        title = "Отель"
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        
        // Навигация
        blueNextButton.action = {
            self.viewModel?.showRooms()
        }
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        view.addSubview(divider)
        view.addSubview(blueNextButton)
        [mainInfoSection, detailInfoSection].forEach { containerView.addSubview($0) }
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mainInfoSection.translatesAutoresizingMaskIntoConstraints = false
        detailInfoSection.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        blueNextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainInfoSection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainInfoSection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mainInfoSection.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            detailInfoSection.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            detailInfoSection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            detailInfoSection.topAnchor.constraint(equalTo: mainInfoSection.bottomAnchor, constant: 8),
            detailInfoSection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            divider.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            blueNextButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 12),
            blueNextButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            blueNextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueNextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    
    // MARK: - Private Methods
    
    private func bindViewModel() {
        viewModel?.$hotel
            .sink { [weak self] hotel in
                DispatchQueue.main.async {
                    self?.updateMainInfoSection(with: hotel)
                    self?.updateDetailInfoSection(with: hotel)
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateMainInfoSection(with hotel: HotelModel) {
        mainInfoSection.ratingView.ratingLabel.text = "\(hotel.rating) \(hotel.ratingName)"
        mainInfoSection.hotelName.text = hotel.name
        mainInfoSection.hotelAddresButton.setTitle(hotel.adress, for: .normal)
        mainInfoSection.priceLabel.text = "от \(hotel.minimalPrice.rubFormat)"
        mainInfoSection.priceForItLabel.text = hotel.priceForIt
    }
    
    private func updateDetailInfoSection(with hotel: HotelModel) {
        detailInfoSection.tagListView.configure(for: hotel.aboutTheHotel.peculiarities)
        detailInfoSection.descriptionLabel.text = hotel.aboutTheHotel.description
    }
}

private struct HotelView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = HotelViewController()
        view.viewModel = HotelViewModel()
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    HotelView()
}
