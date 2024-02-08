//
//  NetworkingServiceHotelSuccessMock.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 08.02.2024.
//

import Foundation
import Combine

class NetworkingServiceHotelSuccessMock: NetworkServiceImpl {
    func fetchData<T>(session: URLSession, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Codable {
        // Моковая реализация запроса, возвращающая заранее заданные данные
        let hotel = HotelModel(id: 1,
                               name: "Steigenberger Makadi",
                               adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                               minimalPrice: 134673,
                               priceForIt: "за тур с перелётом",
                               rating: 5,
                               ratingName: "Превосходно",
                               imageUrls: [],
                               aboutTheHotel: AboutTheHotel(description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                                                            peculiarities: ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
                                                           )
        )
        
        return Just(hotel as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
