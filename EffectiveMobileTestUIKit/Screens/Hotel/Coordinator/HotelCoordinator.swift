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
        let hotelVC = HotelViewController()
        let hotelViewModel = HotelViewModel()
        hotelViewModel.coordinator = self
        hotelVC.viewModel = hotelViewModel
        navigationController.pushViewController(hotelVC, animated: true)
    }
    
    func showRooms() {
        let hotelRoomVC = HotelRoomsViewController()
        let hotelRoomViewModel = HotelRoomViewModel()
        hotelRoomViewModel.coordinator = HotelRoomsCoordinator(navigationController: navigationController)
        hotelRoomVC.viewModel = hotelRoomViewModel
        navigationController.pushViewController(hotelRoomVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
