//
//  NetworkingServiceHotelRoomSuccessMock.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 08.02.2024.
//

import Combine
import Foundation

class NetworkingServiceHotelRoomSuccessMock: NetworkServiceImpl {
    func fetchData<T>(session: URLSession, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Codable {
        // Моковая реализация запроса, возвращающая заранее заданные данные
        let hotelRooms = RoomsModel(rooms: [
            Room(id: 1,
                 name: "Стандартный с видом на бассейн",
                 price: 186600,
                 pricePer: "За 7 ночей  с перелётом",
                 peculiarities: ["Включён только завтрак", "Кондиционер", "Подробнее о номере"],
                 imageUrls: []),
            Room(id: 2,
                 name: "Люкс номер с видом на море",
                 price: 289400,
                 pricePer: "За 7 ночей  с перелётом",
                 peculiarities: ["Всё включено", "Кондиционер", "Собственный бассейн", "Подробнее о номере"],
                 imageUrls: [])
        ])
        
        return Just(hotelRooms as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
