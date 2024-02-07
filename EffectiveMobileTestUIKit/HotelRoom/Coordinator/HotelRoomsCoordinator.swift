//
//  HotelRoomsCoordinator.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import UIKit

class HotelRoomsCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showHotelBooking() {
        let hotelBookingVC = HotelBookingViewController()
        hotelBookingVC.coordinator = HotelBookingCoordinator(navigationController: navigationController)
        navigationController.pushViewController(hotelBookingVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
