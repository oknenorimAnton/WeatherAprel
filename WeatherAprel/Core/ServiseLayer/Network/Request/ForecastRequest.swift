//
//  ForecastRequest.swift
//  WeatherAprel
//
//  Created by Антон on 10.05.2023.
//

import Foundation

struct ForecastRequest: Encodable {
    let lat: Double
    let lon: Double
    let limit: Int
}
