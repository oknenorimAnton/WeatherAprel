//
//  Section.swift
//  WeatherAprel
//
//  Created by Антон on 21.05.2023.
//

struct Section {
    let type: SectionType
    let rows: [RowType]
}

enum SectionType {
    case currentForecast
    case futureForecast
}

enum RowType {
    case currentForecast(viewModel: CurrentForecastViewModel)
    case futureForecast(viewModel: FutureForecastViewModel)
}
