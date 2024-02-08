//
//  HotelViewModel.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import Foundation
import Combine

class HotelViewModel: ObservableObject {
    
    var coordinator: HotelCoordinator?
    
    private let networkingService: NetworkServiceImpl
    private var cancellables = Set<AnyCancellable>()
    
    @Published var hotel: HotelModel = HotelModel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))
    
    init(networkingService: NetworkServiceImpl = NetworkingServiceHotelSuccessMock()) {
        self.networkingService = networkingService
        fetchHotel()
    }
    
    func showRooms() {
        coordinator?.showRooms()
    }
    
    private func fetchHotel() {
        networkingService.fetchData(session: .shared, endpoint: .hotel, type: HotelModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка получения данных отеля: \(error)")
                }
            } receiveValue: { [weak self] hotel in
                self?.hotel = hotel
            }
            .store(in: &cancellables)
    }
}
