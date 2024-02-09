//
//  Endpoint.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 08.02.2024.
//

import Foundation

enum Endpoint {
    case hotel
    case hotelRoom
    case hotelBooking
    case bookingResult
}

extension Endpoint {
    enum MethodType: Equatable {
        case GET
    }
}

extension Endpoint {
    var host: String { "run.mocky.io" }
    
    var path: String {
        switch self {
        case .hotel: return "/v3/75000507-da9a-43f8-a618-df698ea7176d"
        case .hotelRoom: return "/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2"
        case .hotelBooking: return "/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        case .bookingResult: return ""
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .hotel, .hotelRoom, .hotelBooking, .bookingResult: 
            return .GET
        }
    }
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        return urlComponents.url
    }
}
