//
//  APIEndpoint.swift
//  WeatherAprel
//
//  Created by Антон on 10.05.2023.
//

enum APIEndpoint {
    case fetchForecast(request: ForecastRequest)
}

extension APIEndpoint: Endpoint {
    var scheme: Scheme {
        switch self {
        case .fetchForecast:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .fetchForecast:
            return "api.weather.yandex.ru"
        }
    }
    
    var path: String {
        switch self {
        case .fetchForecast:
            return "/v2/forecast"
        }
    }
    
    var queryItems: [String: Any] {
        switch self {
        case let .fetchForecast(request):
            return request.asDictionary()
        }
    }
    
    var method: Method {
        switch self {
        case .fetchForecast:
            return .get
        }
    }
    
    var headers: [String: String] {
        var headers = [String: String]()
        switch self {
        case .fetchForecast:
            headers["X-Yandex-API-Key"] = Constants.apiKey
        }
        return headers
    }
}
