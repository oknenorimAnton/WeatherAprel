//
//  MainPresenter.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//
import Foundation

protocol MainPresentationLogic: AnyObject {
    func viewDidLoad()
}

final class MainPresenter {
    weak var view: MainDisplayLogic?
    
    private let apiManager: APIManagable
    private let locationManager: LocationManagable
    
    init(
        apiManager: APIManagable,
        locationManager: LocationManagable
    ) {
        self .apiManager = apiManager
        self .locationManager = locationManager
    }
}

extension MainPresenter: MainPresentationLogic {
    func viewDidLoad() {
        Task {
            do {
                let location = try await locationManager.fetchLocation()
                let request = ForecastRequest(
                    lat: location.latitude,
                    lon: location.longitude,
                    limit: Constants.limit
                )
                
                let response = try await apiManager.fetchForecast(request: request)
                let sections: [Section] = [
                makeCurrentForecastSection(from: response),
                makeFutureForecastSection(from: response)
                ]
                
                await MainActor.run {
                    view?.update(sections: sections)
                }
            } catch {
                await MainActor.run {
                    view?.showError()
                }
            }
        }
    }
}

private extension MainPresenter {
    func makeImageData(from icon: ForecastFact.Icon) -> Data? {
        let urlString = "https://yastatic.net/weather/i/icons/funky/dark/\(icon.rawValue).svg"
        guard let url = URL(string: urlString) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    func makeCurrentForecastSection(from response: ForecastResponse) -> Section {
        Section(type: .currentForecast, rows: [.currentForecast(viewModel: CurrentForecastViewModel(response: response, imageData: makeImageData(from: response.fact.icon)))])
    }
    
    func makeFutureForecastSection(from response: ForecastResponse) -> Section {
        let rows = response.forecasts.map {
            let viewModel = FutureForecastViewModel(response: $0)
            return RowType.futureForecast(viewModel: viewModel)
        }
        return Section(type: .futureForecast, rows: rows)
    }
}
