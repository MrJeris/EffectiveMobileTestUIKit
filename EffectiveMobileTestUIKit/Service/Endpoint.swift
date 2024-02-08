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
        case .hotel: return "/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        case .hotelRoom: return "/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        case .hotelBooking: return "/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
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
