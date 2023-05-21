//
//  NetworkManager.swift
//  WeatherAprel
//
//  Created by Антон on 03.05.2023.
//

import Foundation

protocol Networkable {
    func request(_ endpoint: APIEndpoint) async throws -> Data
}

final class NetworkManager {
    private let decoderManager: Decoderable
    
    init(decoderManager: Decoderable) {
        self.decoderManager = decoderManager
    }
}

extension NetworkManager: Networkable {
    func request(_ endpoint: APIEndpoint) async throws -> Data {
        guard let urlRequest = makeURLRequest(endpoint: endpoint) else {
            let error = URLError(.badURL)
            throw error
        }
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
            let error = URLError(.badServerResponse)
            throw error
        }
        switch httpURLResponse.statusCode {
        case 200...299:
            return data
        default:
            let error = URLError(.badServerResponse)
            throw error
        }
    }
    
    private func makeURLRequest(endpoint: Endpoint) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme.rawValue
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        var queryItems = [URLQueryItem]()
        
        endpoint.queryItems.forEach {
            queryItems.append(.init(name: $0, value: "\($1)"))
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        endpoint.headers.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        return urlRequest
    }
}
