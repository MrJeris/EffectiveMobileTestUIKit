//
//  NetworkingServiceHotelBookingSuccessMock.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 08.02.2024.
//

import Combine
import Foundation

class NetworkingServiceHotelBookingSuccessMock: NetworkServiceImpl {
    func fetchData<T>(session: URLSession, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Codable {
        // Моковая реализация запроса, возвращающая заранее заданные данные
        let hotelBooking = BookingModel(id: 1,
                                        hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
                                        hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                                        horating: 5,
                                        ratingName: "Превосходно",
                                        departure: "Москва",
                                        arrivalCountry: "Египет, Хургада",
                                        tourDateStart: "19.09.2023",
                                        tourDateStop: "27.09.2023",
                                        numberOfNights: 7,
                                        room: "Люкс номер с видом на море",
                                        nutrition: "Все включено",
                                        tourPrice: 289400,
                                        fuelCharge: 9300,
                                        serviceCharge: 2150)
        
        return Just(hotelBooking as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
