//
//  BookingResultCoordinator.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import UIKit

class BookingResultCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }
}
