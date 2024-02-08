//
//  HotelBookingViewController.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 05.02.2024.
//

import Combine
import UIKit
import SwiftUI

class HotelBookingViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: HotelBookingViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Elements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let ratingAndNameHotelView = RatingNameHotelView()
    let bookingDetailsView = BookingDetailsView()
    let infoAboutBuyerView = InformationAboutBuyerView()
    let firstTouristInformationView = TouristInformationView(touristNumber: "Первый турист")
    let secondTouristInformationView = TouristInformationView(touristNumber: "Второй турист")
    
    private let addTouristLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blackColor
        label.textAlignment = .left
        label.text = "Добавить туриста"
        return label
    }()
    
    private let addTouristButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let addTouristView: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fill
        hStack.layer.cornerRadius = 12
        hStack.backgroundColor = .white
        hStack.isLayoutMarginsRelativeArrangement = true
        hStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        return hStack
    }()
    
    let paymentDetailsView = PaymentDetailsView()
    
    private let divider: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return uiView
    }()
    
    let blueNextButton = BlueNextButtonView(title: "Оплатить 198 036 Р")
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .grayBackgroundColor
        return containerView
    }()
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupSubviews()
        setupConstraints()
        
        bindViewModel()
    }
    
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        view.backgroundColor = .grayBackgroundColor
        scrollView.frame = view.bounds
        title = "Бронирование"
        
        secondTouristInformationView.isVStackVisible = false
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        
        blueNextButton.action = {
            self.viewModel?.coordinator?.showBookingResult()
        }
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        view.addSubview(divider)
        view.addSubview(blueNextButton)
        [addTouristLabel, addTouristButton].forEach { addTouristView.addArrangedSubview($0) }
        [ratingAndNameHotelView, bookingDetailsView, infoAboutBuyerView, firstTouristInformationView, secondTouristInformationView, addTouristView, paymentDetailsView].forEach { containerView.addSubview($0) }
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        ratingAndNameHotelView.translatesAutoresizingMaskIntoConstraints = false
        bookingDetailsView.translatesAutoresizingMaskIntoConstraints = false
        infoAboutBuyerView.translatesAutoresizingMaskIntoConstraints = false
        firstTouristInformationView.translatesAutoresizingMaskIntoConstraints = false
        secondTouristInformationView.translatesAutoresizingMaskIntoConstraints = false
        addTouristView.translatesAutoresizingMaskIntoConstraints = false
        paymentDetailsView.translatesAutoresizingMaskIntoConstraints = false
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
            
            ratingAndNameHotelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            ratingAndNameHotelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            ratingAndNameHotelView.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            bookingDetailsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bookingDetailsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bookingDetailsView.topAnchor.constraint(equalTo: ratingAndNameHotelView.bottomAnchor, constant: 8),
            
            infoAboutBuyerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            infoAboutBuyerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            infoAboutBuyerView.topAnchor.constraint(equalTo: bookingDetailsView.bottomAnchor, constant: 8),
            
            firstTouristInformationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            firstTouristInformationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            firstTouristInformationView.topAnchor.constraint(equalTo: infoAboutBuyerView.bottomAnchor, constant: 8),
            
            secondTouristInformationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            secondTouristInformationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            secondTouristInformationView.topAnchor.constraint(equalTo: firstTouristInformationView.bottomAnchor, constant: 8),
            
            addTouristView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            addTouristView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            addTouristView.topAnchor.constraint(equalTo: secondTouristInformationView.bottomAnchor, constant: 8),
            addTouristButton.widthAnchor.constraint(equalToConstant: 32),
            addTouristButton.heightAnchor.constraint(equalToConstant: 32),
            
            paymentDetailsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paymentDetailsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paymentDetailsView.topAnchor.constraint(equalTo: addTouristView.bottomAnchor, constant: 8),
            paymentDetailsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
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
        viewModel?.$hotelBooking
            .sink { [weak self] hotelBooking in
                DispatchQueue.main.async {
                    // Обновление интерфейса на основе данных из ViewModel
                    self?.updateUI(with: hotelBooking)
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateUI(with hotelBooking: BookingModel) {
        ratingAndNameHotelView.ratingView.ratingLabel.text = "\(hotelBooking.horating) \(hotelBooking.ratingName)"
        ratingAndNameHotelView.hotelName.text = hotelBooking.hotelName
        ratingAndNameHotelView.hotelAddresButton.setTitle(hotelBooking.hotelAdress, for: .normal)
        
        bookingDetailsView.departure.rightLabel.text = hotelBooking.departure
        bookingDetailsView.arrivalCountry.rightLabel.text = hotelBooking.arrivalCountry
        bookingDetailsView.tourDateStartStop.rightLabel.text = "\(hotelBooking.tourDateStart) - \(hotelBooking.tourDateStop)"
        bookingDetailsView.numberOfNights.rightLabel.text = "\(hotelBooking.numberOfNights) ночей"
        bookingDetailsView.hotelName.rightLabel.text = hotelBooking.hotelName
        bookingDetailsView.room.rightLabel.text = hotelBooking.room
        bookingDetailsView.nutrition.rightLabel.text = hotelBooking.nutrition
        
        paymentDetailsView.tourPrice.rightLabel.text = "\(hotelBooking.tourPrice) P"
        paymentDetailsView.fuelCharge.rightLabel.text = "\(hotelBooking.fuelCharge) P"
        paymentDetailsView.serviceCharge.rightLabel.text = "\(hotelBooking.serviceCharge) P"
        paymentDetailsView.totalPrice.rightLabel.text = "\(hotelBooking.tourPrice + hotelBooking.fuelCharge + hotelBooking.serviceCharge) P"
    }
}

private struct HotelBookingView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = HotelBookingViewController()
        view.viewModel = HotelBookingViewModel()
//        view.ratingAndNameHotelView.ratingView.ratingLabel.text = "\(5) Превосходно"
//        view.ratingAndNameHotelView.hotelName.text = "Steigenberger Makadi"
//        view.ratingAndNameHotelView.hotelAddresButton.setTitle("Madinat Makadi, Safaga Road, Makadi Bay, Египет", for: .normal)
//        
//        view.bookingDetailsView.departure.rightLabel.text = "Санкт-Петербург"
//        view.bookingDetailsView.arrivalCountry.rightLabel.text = "Египет, Хургада"
//        view.bookingDetailsView.tourDateStartStop.rightLabel.text = "19.09.2023 – 27.09.2023"
//        view.bookingDetailsView.numberOfNights.rightLabel.text = "7 ночей"
//        view.bookingDetailsView.hotelName.rightLabel.text = "Steigenberger Makadi"
//        view.bookingDetailsView.room.rightLabel.text = "Стандартный с видом на бассейн или сад"
//        view.bookingDetailsView.nutrition.rightLabel.text = "Все включено"
//        
//        view.paymentDetailsView.tourPrice.rightLabel.text = "186 600 P"
//        view.paymentDetailsView.fuelCharge.rightLabel.text = "9 300 P"
//        view.paymentDetailsView.serviceCharge.rightLabel.text = "2 136 P"
//        view.paymentDetailsView.totalPrice.rightLabel.text = "198 036 P"
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

#Preview {
    HotelBookingView()
}
