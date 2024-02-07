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
    
    func showHotelBooking() {
        let bookingResult = BookingResultController()
        bookingResult.coordinator = BookingResultCoordinator(navigationController: navigationController)
        navigationController.pushViewController(bookingResult, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
