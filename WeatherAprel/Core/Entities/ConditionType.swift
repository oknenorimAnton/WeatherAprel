//
//  ConditionType.swift
//  WeatherAprel
//
//  Created by Антон on 21.05.2023.
//

enum ConditionType: String {
    case overcast
    case parltyCloudy = "partly-cloudy"
    case lightRaid = "light-rain"
    case clear
    case cloudy
    case drizzle
    case rain
    case moderateRain = "moderate-rain"
    case heavyRain = "heavy-rain"
    case continuousHeavyRain = "continuous-heavy-rain"
    case showers
    case wetSnow = "wet-snow"
    case lightSnow = "light-snow"
    case snow
    case snowShowers = "snow-showers"
    case hail
    case thunderstorm
    case thunderstormWithRain = "thunderstorm-with-rain"
    case thunderstormWithHail = "thunderstorm-with-hail"
    case unknown
    
    var descriprion: String {
        switch self {
        
        case .overcast:
            return "пасмурно"
        case .parltyCloudy:
            return "малооблачно"
        case .lightRaid:
            return "небольшой дождь"
        case .clear:
            return "ясно"
        case .cloudy:
            return "облачно с прояснениями"
        case .drizzle:
            return "морось"
        case .rain:
            return "дождь"
        case .moderateRain:
            return "умеренно сильный дождь"
        case .heavyRain:
            return "сильный дождь"
        case .continuousHeavyRain:
            return "длительный сильный дождь"
        case .showers:
            return "ливень"
        case .wetSnow:
            return "дождь со снегом"
        case .lightSnow:
            return "небольшой снег"
        case .snow:
            return "снег"
        case .snowShowers:
            return "снегопад"
        case .hail:
            return "град"
        case .thunderstorm:
            return "гроза"
        case .thunderstormWithRain:
            return "дождь с грозой"
        case .thunderstormWithHail:
            return "гроза с градом"
        case .unknown:
            return "неизвестно"
        }
    }
}
