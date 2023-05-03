//
//  MainPresenter.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//

protocol MainPresentationLogic: AnyObject {
}

final class MainPresenter {
    weak var view: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
}
