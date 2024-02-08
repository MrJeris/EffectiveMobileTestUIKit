//
//  HotelBookingCoordinator.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import UIKit

class HotelBookingCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showBookingResult() {
        let bookingResultVC = BookingResultController()
        let bookingResultViewModel = BookingResultViewModel()
        bookingResultViewModel.coordinator = BookingResultCoordinator(navigationController: navigationController)
        bookingResultVC.viewModel = bookingResultViewModel
        navigationController.pushViewController(bookingResultVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
