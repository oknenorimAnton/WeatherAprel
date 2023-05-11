//
//  MainViewController.swift
//  WeatherAprel
//
//  Created by Антон on 02.05.2023.
//

import UIKit

protocol MainDisplayLogic: AnyObject {}

final class MainViewController: UIViewController {
    var presenter: MainPresentationLogic?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoad()
    }
}

extension MainViewController: MainDisplayLogic {
    func update() {
        print(#function)
    }
}

