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
}

extension SceneBuildManager: SceneBuildManagable {
    func buildMainScene() -> MainViewController {
            let viewController = MainViewController()
            let presenter = MainPresenter()
            
            viewController.presenter = presenter
            presenter.view = viewController
            
            return viewController
    }
}
