//
//  MainPresenter.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//

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
                let request = ForecastRequest(lat: location.latitude, lon: location.longitude)
                let response = try await apiManager.fetchForecast(request: request)
                await MainActor.run {
                }
            } catch {
                await MainActor.run {
                }
            }
        }
    }
}
