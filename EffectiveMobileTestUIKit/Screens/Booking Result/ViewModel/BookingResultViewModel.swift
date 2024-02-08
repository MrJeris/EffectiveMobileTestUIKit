//
//  BookingResultViewModel.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import Foundation

class BookingResultViewModel: ObservableObject {
    
    var coordinator: BookingResultCoordinator?
    
    func goToMainScreen() {
        coordinator?.goToMain()
    }
}
