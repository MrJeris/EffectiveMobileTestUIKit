//
//  HotelRoomViewModel.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 07.02.2024.
//

import Combine
import Foundation

class HotelRoomViewModel: ObservableObject {
    
    var coordinator: HotelRoomsCoordinator?
    
    private let networkingService: NetworkServiceImpl
    private var cancellables = Set<AnyCancellable>()
    
    @Published var rooms = RoomsModel(rooms: [])
    
    init(networkingService: NetworkServiceImpl = NetworkService.shared) {
        self.networkingService = networkingService
        getRooms()
    }
    
    private func getRooms() {
        networkingService.fetchData(session: .shared, endpoint: .hotelRoom, type: RoomsModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка получения данных номеров: \(error)")
                }
            } receiveValue: { [weak self] rooms in
                self?.rooms = rooms
            }
            .store(in: &cancellables)
    }
}
