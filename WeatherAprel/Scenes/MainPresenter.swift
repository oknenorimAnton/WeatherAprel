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
    
    init(apiManager: APIManagable) {
        self.apiManager = apiManager
    }
}

extension MainPresenter: MainPresentationLogic {
    func viewDidLoad() {
        Task {
            do {
                let request = ForecastRequest(lat: 45.0448400, lon: 38.9760300)
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
