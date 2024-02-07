//
//  HotelCoordinator.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import UIKit

class HotelCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userListVC = HotelViewController()
        userListVC.coordinator = self
        navigationController.pushViewController(userListVC, animated: true)
    }
    
    func showRooms() {
        let hotelRoomVC = HotelRoomsViewController()
        hotelRoomVC.coordinator = HotelRoomsCoordinator(navigationController: navigationController)
        navigationController.pushViewController(hotelRoomVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
