//
//  FutureForecastViewModel.swift
//  WeatherAprel
//
//  Created by Антон on 15.05.2023.
//

struct FutureForecastViewModel {
    let date: String
    let temperature: String
    let condition: ConditionType
    
    init(date: String, temperature: String, condition: ConditionType) {
        self.date = date
        self.temperature = temperature
        self.condition = condition
    }
    init(response: ForecastInfo) {
        let responseDate = Formatter.format(dateString: response.date, dateFormat: .yyyymmdd)
        
        date = Formatter.format(date: responseDate, dateFormat: .ddMMMM) ?? "nil"
        temperature = "\(response.parts.day?.tempAvg ?? .zero) °C"
        condition = ConditionType(rawValue: response.parts.day?.condition ?? "") ?? .unknown
    }
}
