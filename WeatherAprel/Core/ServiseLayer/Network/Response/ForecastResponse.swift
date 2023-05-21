//
//  ForecastResponse.swift
//  WeatherAprel
//
//  Created by Антон on 03.05.2023.
//

struct ForecastResponse: Decodable {
    let now: Int
    let nowDt: String
    let geoObject: GeoObject
    let fact: ForecastFact
    let forecasts: [ForecastInfo]
    
    private enum CodingKeys: String, CodingKey {
        case now, fact, forecasts
        case nowDt = "now_dt"
        case geoObject = "geo_object"
    }
}

struct GeoObject: Decodable {
    let locality: Locality
}

struct Locality: Decodable {
    let name: String
}

struct ForecastFact: Decodable {
    let temp: Int
    let feelsLike: Int
    let icon: Icon
    let condition: String
    
    private enum CodingKeys: String, CodingKey {
        case temp, icon, condition
        case feelsLike = "feels_like"
    }
    
    enum Icon: String, Decodable {
        case bknD = "bkn_d"
        case bknN = "bkn_n"
        case bknRaD = "bkn_-ra_d"
        case ovc = "ovc"
        case ovcRa = "ovc_-ra"
        case skcD = "skc_d"
        case skcN = "skc_n"
    }
}

struct ForecastInfo: Decodable {
    let date: String
    let parts: Parts
}

struct Parts: Decodable {
    let day: Day?
}

struct Day: Decodable {
    let tempAvg: Int
    let condition: String
    
    private enum CodingKeys: String, CodingKey {
        case tempAvg = "temp_avg"
        case condition
    }
}
