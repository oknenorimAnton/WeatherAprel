//
//  APIManager.swift
//  WeatherAprel
//
//  Created by Антон on 03.05.2023.
//
import Foundation

protocol APIManagable {
    func fetchForecast(request: ForecastRequest) async throws -> ForecastResponse
}

class APIManager {
    private let networkManager: Networkable
    private let decoderManager: Decoderable
    
    init(
        networkManager: Networkable,
        decoderManager: Decoderable
    ){
        self.networkManager = networkManager
        self.decoderManager = decoderManager
    }
}

extension APIManager: APIManagable {
    
    func fetchForecast(request: ForecastRequest) async throws -> ForecastResponse {
        let data = try await networkManager.request(.fetchForecast(request: request))
        let result: ForecastResponse = try decoderManager.decode(data: data)
        return result
    }
}
