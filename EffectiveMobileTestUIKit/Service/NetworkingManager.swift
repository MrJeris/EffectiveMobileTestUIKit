//
//  NetworkingService.swift
//  EffectiveMobileTestUIKit
//
//  Created by Ruslan Magomedov on 08.02.2024.
//

import Foundation
import Combine

protocol NetworkServiceImpl {
    func fetchData<T: Codable>(session: URLSession, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Codable
}

final class NetworkService: NetworkServiceImpl {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchData<T>(session: URLSession = .shared, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Codable {
        guard let url = endpoint.url else {
            return Fail(error: NetworkingManager.invalidUrl).eraseToAnyPublisher()
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                    throw NetworkingManager.invalidStatusCode(statusCode: statusCode)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

extension NetworkService {
    enum NetworkingManager: LocalizedError {
        case invalidUrl
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

private func buildRequest(from url: URL, methodType: Endpoint.MethodType) -> URLRequest {
    var request = URLRequest(url: url)
    
    switch methodType {
    case .GET:
        request.httpMethod = "GET"
    }
    
    return request
}
