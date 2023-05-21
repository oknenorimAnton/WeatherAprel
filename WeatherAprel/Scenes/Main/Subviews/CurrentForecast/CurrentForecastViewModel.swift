//
//  CurrentForecastViewModel.swift
//  WeatherAprel
//
//  Created by Антон on 15.05.2023.
//
import Foundation

struct CurrentForecastViewModel {
    let city: String
    let temperature: String
    let condition: ConditionType
    let imageData: Data?
    
    init(city: String, temperature: String, condition: ConditionType, imageData: Data?) {
        self.city = city
        self.temperature = temperature
        self.condition = condition
        self.imageData = imageData
    }
    
    init(response: ForecastResponse, imageData: Data?) {
        self.city = "\(response.geoObject.locality.name)"
        self.temperature = "\(response.fact.temp) °C"
        self.condition = ConditionType(rawValue: response.fact.condition) ?? .unknown
        self.imageData = imageData
    }
}
