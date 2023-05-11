//
//  SceneBuildManager.swift
//  WeatherAprel
//
//  Created by Антон on 03.05.2023.
//

protocol SceneBuildManagable {
    func buildMainScene() -> MainViewController
}

final class SceneBuildManager {
    private lazy var decoderManager = DecoderManager()
    private lazy var networkManager = NetworkManager(decoderManager: decoderManager)
    private lazy var apiManager = APIManager(networkManager: networkManager, decoderManager: decoderManager)
}

extension SceneBuildManager: SceneBuildManagable {
    func buildMainScene() -> MainViewController {
            let viewController = MainViewController()
        let presenter = MainPresenter(apiManager: apiManager)
            
            viewController.presenter = presenter
            presenter.view = viewController
            
            return viewController
    }
}
