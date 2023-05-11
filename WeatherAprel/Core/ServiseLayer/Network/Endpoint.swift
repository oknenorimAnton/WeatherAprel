//
//  Endpoint.swift
//  WeatherAprel
//
//  Created by Антон on 10.05.2023.
//

protocol Endpoint {
    var scheme: Scheme { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [String: Any] { get }
    var method: Method { get }
    var headers: [String: String] { get }
}
