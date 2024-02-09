//
//  HotelBookingViewModel.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import Combine
import Foundation

class HotelBookingViewModel: ObservableObject {
    
    var coordinator: HotelBookingCoordinator?
    
    private let networkingService: NetworkServiceImpl
    private var cancellables = Set<AnyCancellable>()
    
    @Published var tourists: [Tourist] = [Tourist(id: 0)]
    
    @Published var hotelBooking: BookingModel = BookingModel(id: 1,
                                                             hotelName: "",
                                                             hotelAdress: "",
                                                             horating: 0,
                                                             ratingName: "",
                                                             departure: "",
                                                             arrivalCountry: "",
                                                             tourDateStart: "",
                                                             tourDateStop: "",
                                                             numberOfNights: 0,
                                                             room: "",
                                                             nutrition: "",
                                                             tourPrice: 0,
                                                             fuelCharge: 0,
                                                             serviceCharge: 0)
    
    init(networkingService: NetworkServiceImpl = NetworkingServiceHotelBookingSuccessMock()) {
        self.networkingService = networkingService
        getHotelBooking()
    }
    
    func showRooms() {
        coordinator?.showBookingResult()
    }
    
    private func getHotelBooking() {
        networkingService.fetchData(session: .shared, endpoint: .hotelBooking, type: BookingModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка получения данных экрана бронирования: \(error)")
                }
            } receiveValue: { [weak self] hotelBooking in
                self?.hotelBooking = hotelBooking
            }
            .store(in: &cancellables)
    }
    
    func addTourist() {
        tourists.append(Tourist(id: tourists.count))
    }
}
